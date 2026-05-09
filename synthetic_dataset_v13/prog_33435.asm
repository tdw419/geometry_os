; DESCRIPTION: Draws a white rectangle at (129, 88) with width 100 and height 40.
; PLAN: r0=129(x), r1=88(y), r2=100(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 88
LDI r2, 100
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
