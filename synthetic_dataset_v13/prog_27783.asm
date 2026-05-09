; DESCRIPTION: Draws a black rectangle at (318, 186) with width 80 and height 12.
; PLAN: r0=318(x), r1=186(y), r2=80(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 186
LDI r2, 80
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
