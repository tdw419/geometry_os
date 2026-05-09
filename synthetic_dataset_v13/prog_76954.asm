; DESCRIPTION: Draws a white rectangle at (213, 110) with width 86 and height 63.
; PLAN: r0=213(x), r1=110(y), r2=86(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 110
LDI r2, 86
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
