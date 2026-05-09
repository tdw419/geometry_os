; DESCRIPTION: Renders a blue box of size 110x114 starting at (289, 95).
; PLAN: r0=289(x), r1=95(y), r2=110(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 95
LDI r2, 110
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
