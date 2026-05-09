; DESCRIPTION: Draws a yellow rectangle at (254, 193) with width 26 and height 52.
; PLAN: r0=254(x), r1=193(y), r2=26(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 193
LDI r2, 26
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
