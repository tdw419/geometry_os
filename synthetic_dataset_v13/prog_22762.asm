; DESCRIPTION: Draws a white rectangle at (269, 162) with width 50 and height 81.
; PLAN: r0=269(x), r1=162(y), r2=50(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 162
LDI r2, 50
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
