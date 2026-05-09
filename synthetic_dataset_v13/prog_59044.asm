; DESCRIPTION: Draws a yellow rectangle at (329, 106) with width 59 and height 116.
; PLAN: r0=329(x), r1=106(y), r2=59(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 106
LDI r2, 59
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
