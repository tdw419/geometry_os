; DESCRIPTION: Draws a white rectangle at (267, 111) with width 107 and height 74.
; PLAN: r0=267(x), r1=111(y), r2=107(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 111
LDI r2, 107
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
