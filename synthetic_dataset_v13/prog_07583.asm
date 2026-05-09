; DESCRIPTION: Draws a white rectangle at (54, 148) with width 104 and height 86.
; PLAN: r0=54(x), r1=148(y), r2=104(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 148
LDI r2, 104
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
