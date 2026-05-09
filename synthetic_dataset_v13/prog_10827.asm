; DESCRIPTION: Renders a blue box of size 51x96 starting at (312, 79).
; PLAN: r0=312(x), r1=79(y), r2=51(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 79
LDI r2, 51
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
