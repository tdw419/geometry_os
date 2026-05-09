; DESCRIPTION: Draws a green rectangle at (267, 14) with width 53 and height 55.
; PLAN: r0=267(x), r1=14(y), r2=53(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 14
LDI r2, 53
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
