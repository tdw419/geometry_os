; DESCRIPTION: Draws a green rectangle at (267, 70) with width 12 and height 92.
; PLAN: r0=267(x), r1=70(y), r2=12(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 70
LDI r2, 12
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
