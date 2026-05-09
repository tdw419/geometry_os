; DESCRIPTION: Draws a yellow rectangle at (55, 186) with width 104 and height 22.
; PLAN: r0=55(x), r1=186(y), r2=104(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 186
LDI r2, 104
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
