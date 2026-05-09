; DESCRIPTION: Draws a white rectangle at (407, 49) with width 81 and height 68.
; PLAN: r0=407(x), r1=49(y), r2=81(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 49
LDI r2, 81
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
