; DESCRIPTION: Draws a white rectangle at (464, 165) with width 44 and height 21.
; PLAN: r0=464(x), r1=165(y), r2=44(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 165
LDI r2, 44
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
