; DESCRIPTION: Draws a green rectangle at (105, 33) with width 117 and height 110.
; PLAN: r0=105(x), r1=33(y), r2=117(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 33
LDI r2, 117
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
