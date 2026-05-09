; DESCRIPTION: Draws a white rectangle at (254, 17) with width 37 and height 102.
; PLAN: r0=254(x), r1=17(y), r2=37(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 17
LDI r2, 37
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
