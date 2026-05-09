; DESCRIPTION: Draws a yellow rectangle at (331, 231) with width 27 and height 15.
; PLAN: r0=331(x), r1=231(y), r2=27(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 231
LDI r2, 27
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
