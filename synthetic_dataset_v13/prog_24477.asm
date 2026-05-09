; DESCRIPTION: Draws a yellow rectangle at (267, 75) with width 53 and height 101.
; PLAN: r0=267(x), r1=75(y), r2=53(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 75
LDI r2, 53
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
