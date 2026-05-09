; DESCRIPTION: Draws a yellow rectangle at (20, 118) with width 70 and height 105.
; PLAN: r0=20(x), r1=118(y), r2=70(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 118
LDI r2, 70
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
