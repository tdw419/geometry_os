; DESCRIPTION: Draws a cyan rectangle at (369, 108) with width 62 and height 25.
; PLAN: r0=369(x), r1=108(y), r2=62(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 108
LDI r2, 62
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
