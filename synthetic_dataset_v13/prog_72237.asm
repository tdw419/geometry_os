; DESCRIPTION: Draws a green rectangle at (246, 56) with width 112 and height 63.
; PLAN: r0=246(x), r1=56(y), r2=112(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 56
LDI r2, 112
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
