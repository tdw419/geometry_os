; DESCRIPTION: Renders a blue box of size 17x102 starting at (185, 75).
; PLAN: r0=185(x), r1=75(y), r2=17(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 75
LDI r2, 17
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
