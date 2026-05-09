; DESCRIPTION: Draws a yellow rectangle at (432, 79) with width 55 and height 54.
; PLAN: r0=432(x), r1=79(y), r2=55(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 79
LDI r2, 55
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
