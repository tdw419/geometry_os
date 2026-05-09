; DESCRIPTION: Renders a blue box of size 35x112 starting at (378, 13).
; PLAN: r0=378(x), r1=13(y), r2=35(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 13
LDI r2, 35
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
