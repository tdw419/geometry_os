; DESCRIPTION: Draws a green rectangle at (9, 1) with width 55 and height 44.
; PLAN: r0=9(x), r1=1(y), r2=55(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 1
LDI r2, 55
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
