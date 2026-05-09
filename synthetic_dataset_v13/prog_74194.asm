; DESCRIPTION: Draws a white rectangle at (276, 20) with width 117 and height 63.
; PLAN: r0=276(x), r1=20(y), r2=117(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 20
LDI r2, 117
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
