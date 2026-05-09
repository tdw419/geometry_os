; DESCRIPTION: Draws a magenta rectangle at (302, 125) with width 117 and height 82.
; PLAN: r0=302(x), r1=125(y), r2=117(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 125
LDI r2, 117
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
