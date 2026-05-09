; DESCRIPTION: Draws a yellow rectangle at (81, 31) with width 46 and height 67.
; PLAN: r0=81(x), r1=31(y), r2=46(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 31
LDI r2, 46
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
