; DESCRIPTION: Draws a green rectangle at (276, 127) with width 79 and height 106.
; PLAN: r0=276(x), r1=127(y), r2=79(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 127
LDI r2, 79
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
