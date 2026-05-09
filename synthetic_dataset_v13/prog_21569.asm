; DESCRIPTION: Renders a blue box of size 79x39 starting at (51, 88).
; PLAN: r0=51(x), r1=88(y), r2=79(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 88
LDI r2, 79
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
