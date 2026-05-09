; DESCRIPTION: Draws a yellow rectangle at (217, 99) with width 19 and height 103.
; PLAN: r0=217(x), r1=99(y), r2=19(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 99
LDI r2, 19
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
