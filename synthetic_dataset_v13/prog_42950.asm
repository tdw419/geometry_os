; DESCRIPTION: Draws a red rectangle at (311, 105) with width 105 and height 113.
; PLAN: r0=311(x), r1=105(y), r2=105(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 105
LDI r2, 105
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
