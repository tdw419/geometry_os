; DESCRIPTION: Draws a white rectangle at (20, 91) with width 43 and height 86.
; PLAN: r0=20(x), r1=91(y), r2=43(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 91
LDI r2, 43
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
