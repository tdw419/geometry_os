; DESCRIPTION: Draws a blue rectangle at (125, 154) with width 83 and height 75.
; PLAN: r0=125(x), r1=154(y), r2=83(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 154
LDI r2, 83
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
