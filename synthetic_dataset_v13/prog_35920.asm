; DESCRIPTION: Draws a blue rectangle at (248, 143) with width 75 and height 106.
; PLAN: r0=248(x), r1=143(y), r2=75(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 143
LDI r2, 75
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
