; DESCRIPTION: Draws a white rectangle at (232, 226) with width 38 and height 21.
; PLAN: r0=232(x), r1=226(y), r2=38(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 226
LDI r2, 38
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
