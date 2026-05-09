; DESCRIPTION: Draws a white rectangle at (162, 217) with width 120 and height 37.
; PLAN: r0=162(x), r1=217(y), r2=120(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 217
LDI r2, 120
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
