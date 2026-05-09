; DESCRIPTION: Draws a yellow rectangle at (337, 140) with width 113 and height 114.
; PLAN: r0=337(x), r1=140(y), r2=113(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 140
LDI r2, 113
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
