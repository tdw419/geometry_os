; DESCRIPTION: Renders a purple box of size 62x83 starting at (356, 147).
; PLAN: r0=356(x), r1=147(y), r2=62(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 147
LDI r2, 62
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
