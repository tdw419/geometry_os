; DESCRIPTION: Renders a purple box of size 65x62 starting at (22, 147).
; PLAN: r0=22(x), r1=147(y), r2=65(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 147
LDI r2, 65
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
