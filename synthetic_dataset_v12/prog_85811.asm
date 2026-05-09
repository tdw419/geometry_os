; DESCRIPTION: Draws a yellow rectangle at (110, 151) with width 36 and height 86.
; PLAN: r0=110(x), r1=151(y), r2=36(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 151
LDI r2, 36
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
