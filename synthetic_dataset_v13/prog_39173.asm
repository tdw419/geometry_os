; DESCRIPTION: Draws a green rectangle at (369, 173) with width 62 and height 15.
; PLAN: r0=369(x), r1=173(y), r2=62(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 173
LDI r2, 62
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
