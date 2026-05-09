; DESCRIPTION: Draws a white rectangle at (162, 76) with width 81 and height 72.
; PLAN: r0=162(x), r1=76(y), r2=81(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 76
LDI r2, 81
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
