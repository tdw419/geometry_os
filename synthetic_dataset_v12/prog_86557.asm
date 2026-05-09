; DESCRIPTION: Draws a white rectangle at (464, 175) with width 12 and height 65.
; PLAN: r0=464(x), r1=175(y), r2=12(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 175
LDI r2, 12
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
