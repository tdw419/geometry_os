; DESCRIPTION: Draws a yellow rectangle at (444, 108) with width 18 and height 115.
; PLAN: r0=444(x), r1=108(y), r2=18(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 108
LDI r2, 18
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
