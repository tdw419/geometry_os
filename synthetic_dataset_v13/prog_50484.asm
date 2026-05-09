; DESCRIPTION: Draws a white rectangle at (124, 216) with width 69 and height 27.
; PLAN: r0=124(x), r1=216(y), r2=69(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 216
LDI r2, 69
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
