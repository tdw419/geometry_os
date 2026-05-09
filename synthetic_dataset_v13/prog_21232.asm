; DESCRIPTION: Draws a yellow rectangle at (1, 116) with width 74 and height 36.
; PLAN: r0=1(x), r1=116(y), r2=74(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 116
LDI r2, 74
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
