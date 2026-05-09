; DESCRIPTION: Draws a yellow rectangle at (253, 7) with width 113 and height 81.
; PLAN: r0=253(x), r1=7(y), r2=113(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 7
LDI r2, 113
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
