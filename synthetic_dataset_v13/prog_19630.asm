; DESCRIPTION: Draws a yellow rectangle at (196, 124) with width 110 and height 106.
; PLAN: r0=196(x), r1=124(y), r2=110(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 124
LDI r2, 110
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
