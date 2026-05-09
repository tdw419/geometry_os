; DESCRIPTION: Renders a blue box of size 18x104 starting at (51, 72).
; PLAN: r0=51(x), r1=72(y), r2=18(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 72
LDI r2, 18
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
