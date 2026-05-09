; DESCRIPTION: Draws a white rectangle at (91, 152) with width 88 and height 17.
; PLAN: r0=91(x), r1=152(y), r2=88(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 152
LDI r2, 88
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
