; DESCRIPTION: Draws a white rectangle at (132, 113) with width 86 and height 68.
; PLAN: r0=132(x), r1=113(y), r2=86(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 113
LDI r2, 86
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
