; DESCRIPTION: Draws a white rectangle at (216, 24) with width 12 and height 81.
; PLAN: r0=216(x), r1=24(y), r2=12(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 24
LDI r2, 12
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
