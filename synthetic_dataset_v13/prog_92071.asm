; DESCRIPTION: Draws a blue rectangle at (267, 20) with width 112 and height 72.
; PLAN: r0=267(x), r1=20(y), r2=112(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 20
LDI r2, 112
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
