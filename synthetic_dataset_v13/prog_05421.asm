; DESCRIPTION: Renders a purple box of size 88x107 starting at (80, 147).
; PLAN: r0=80(x), r1=147(y), r2=88(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 147
LDI r2, 88
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
