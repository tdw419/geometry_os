; DESCRIPTION: Draws a green rectangle at (232, 174) with width 71 and height 57.
; PLAN: r0=232(x), r1=174(y), r2=71(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 174
LDI r2, 71
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
