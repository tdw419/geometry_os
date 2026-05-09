; DESCRIPTION: Draws a yellow rectangle at (134, 97) with width 87 and height 111.
; PLAN: r0=134(x), r1=97(y), r2=87(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 97
LDI r2, 87
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
