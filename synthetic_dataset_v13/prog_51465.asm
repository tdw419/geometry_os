; DESCRIPTION: Draws a green rectangle at (25, 5) with width 75 and height 55.
; PLAN: r0=25(x), r1=5(y), r2=75(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 5
LDI r2, 75
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
