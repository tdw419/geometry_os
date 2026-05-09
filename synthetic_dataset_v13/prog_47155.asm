; DESCRIPTION: Draws a black rectangle at (218, 109) with width 118 and height 74.
; PLAN: r0=218(x), r1=109(y), r2=118(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 109
LDI r2, 118
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
