; DESCRIPTION: Draws a white rectangle at (137, 165) with width 65 and height 53.
; PLAN: r0=137(x), r1=165(y), r2=65(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 165
LDI r2, 65
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
