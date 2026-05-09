; DESCRIPTION: Draws a yellow rectangle at (18, 118) with width 67 and height 87.
; PLAN: r0=18(x), r1=118(y), r2=67(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 118
LDI r2, 67
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
