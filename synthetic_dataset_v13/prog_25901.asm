; DESCRIPTION: Draws a white rectangle at (123, 43) with width 20 and height 13.
; PLAN: r0=123(x), r1=43(y), r2=20(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 43
LDI r2, 20
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
