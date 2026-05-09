; DESCRIPTION: Draws a red rectangle at (397, 51) with width 10 and height 118.
; PLAN: r0=397(x), r1=51(y), r2=10(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 51
LDI r2, 10
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
