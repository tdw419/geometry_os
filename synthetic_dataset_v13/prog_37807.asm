; DESCRIPTION: Draws a black rectangle at (389, 178) with width 39 and height 75.
; PLAN: r0=389(x), r1=178(y), r2=39(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 178
LDI r2, 39
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
