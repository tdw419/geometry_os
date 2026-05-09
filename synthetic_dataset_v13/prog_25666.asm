; DESCRIPTION: Draws a red rectangle at (431, 35) with width 75 and height 115.
; PLAN: r0=431(x), r1=35(y), r2=75(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 35
LDI r2, 75
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
