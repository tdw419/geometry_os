; DESCRIPTION: Draws a red rectangle at (366, 194) with width 69 and height 51.
; PLAN: r0=366(x), r1=194(y), r2=69(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 194
LDI r2, 69
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
