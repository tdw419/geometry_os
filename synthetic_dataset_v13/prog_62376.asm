; DESCRIPTION: Draws a magenta rectangle at (142, 151) with width 113 and height 79.
; PLAN: r0=142(x), r1=151(y), r2=113(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 151
LDI r2, 113
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
