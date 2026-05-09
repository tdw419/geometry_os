; DESCRIPTION: Draws a yellow rectangle at (439, 219) with width 68 and height 22.
; PLAN: r0=439(x), r1=219(y), r2=68(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 219
LDI r2, 68
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
