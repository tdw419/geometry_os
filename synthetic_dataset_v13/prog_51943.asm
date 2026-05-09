; DESCRIPTION: Draws a yellow rectangle at (207, 58) with width 108 and height 110.
; PLAN: r0=207(x), r1=58(y), r2=108(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 58
LDI r2, 108
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
