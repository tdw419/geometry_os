; DESCRIPTION: Draws a green rectangle at (433, 75) with width 10 and height 105.
; PLAN: r0=433(x), r1=75(y), r2=10(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 75
LDI r2, 10
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
