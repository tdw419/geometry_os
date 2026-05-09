; DESCRIPTION: Draws a yellow rectangle at (318, 141) with width 87 and height 49.
; PLAN: r0=318(x), r1=141(y), r2=87(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 141
LDI r2, 87
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
