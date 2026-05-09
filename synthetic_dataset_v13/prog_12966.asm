; DESCRIPTION: Draws a green rectangle at (369, 152) with width 83 and height 23.
; PLAN: r0=369(x), r1=152(y), r2=83(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 152
LDI r2, 83
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
