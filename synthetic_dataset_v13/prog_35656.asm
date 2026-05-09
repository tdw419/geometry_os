; DESCRIPTION: Draws a white rectangle at (75, 9) with width 81 and height 117.
; PLAN: r0=75(x), r1=9(y), r2=81(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 9
LDI r2, 81
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
