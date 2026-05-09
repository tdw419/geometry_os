; DESCRIPTION: Draws a cyan rectangle at (369, 159) with width 21 and height 17.
; PLAN: r0=369(x), r1=159(y), r2=21(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 159
LDI r2, 21
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
