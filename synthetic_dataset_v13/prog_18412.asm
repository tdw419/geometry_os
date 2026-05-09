; DESCRIPTION: Draws a blue rectangle at (106, 121) with width 116 and height 78.
; PLAN: r0=106(x), r1=121(y), r2=116(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 121
LDI r2, 116
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
