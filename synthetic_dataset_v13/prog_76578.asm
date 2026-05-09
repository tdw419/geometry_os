; DESCRIPTION: Renders a blue box of size 66x33 starting at (289, 25).
; PLAN: r0=289(x), r1=25(y), r2=66(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 25
LDI r2, 66
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
