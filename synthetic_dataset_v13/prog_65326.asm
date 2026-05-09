; DESCRIPTION: Draws a yellow rectangle at (175, 104) with width 99 and height 112.
; PLAN: r0=175(x), r1=104(y), r2=99(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 104
LDI r2, 99
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
