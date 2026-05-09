; DESCRIPTION: Draws a yellow rectangle at (253, 141) with width 97 and height 24.
; PLAN: r0=253(x), r1=141(y), r2=97(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 141
LDI r2, 97
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
