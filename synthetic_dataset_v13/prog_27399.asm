; DESCRIPTION: Draws a white rectangle at (138, 148) with width 88 and height 48.
; PLAN: r0=138(x), r1=148(y), r2=88(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 148
LDI r2, 88
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
