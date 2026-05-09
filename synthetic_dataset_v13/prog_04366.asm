; DESCRIPTION: Draws a green rectangle at (162, 117) with width 11 and height 35.
; PLAN: r0=162(x), r1=117(y), r2=11(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 117
LDI r2, 11
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
