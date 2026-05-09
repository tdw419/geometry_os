; DESCRIPTION: Draws a yellow rectangle at (406, 144) with width 63 and height 94.
; PLAN: r0=406(x), r1=144(y), r2=63(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 144
LDI r2, 63
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
