; DESCRIPTION: Draws a red rectangle at (13, 125) with width 52 and height 115.
; PLAN: r0=13(x), r1=125(y), r2=52(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 125
LDI r2, 52
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
