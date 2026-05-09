; DESCRIPTION: Draws a yellow rectangle at (176, 218) with width 100 and height 27.
; PLAN: r0=176(x), r1=218(y), r2=100(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 218
LDI r2, 100
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
