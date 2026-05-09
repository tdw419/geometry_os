; DESCRIPTION: Draws a yellow rectangle at (318, 28) with width 15 and height 27.
; PLAN: r0=318(x), r1=28(y), r2=15(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 28
LDI r2, 15
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
