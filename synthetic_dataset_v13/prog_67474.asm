; DESCRIPTION: Draws a blue rectangle at (83, 65) with width 34 and height 75.
; PLAN: r0=83(x), r1=65(y), r2=34(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 65
LDI r2, 34
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
