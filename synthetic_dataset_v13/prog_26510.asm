; DESCRIPTION: Draws a yellow rectangle at (283, 132) with width 53 and height 114.
; PLAN: r0=283(x), r1=132(y), r2=53(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 132
LDI r2, 53
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
