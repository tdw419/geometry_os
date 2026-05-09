; DESCRIPTION: Draws a yellow rectangle at (248, 124) with width 110 and height 97.
; PLAN: r0=248(x), r1=124(y), r2=110(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 124
LDI r2, 110
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
