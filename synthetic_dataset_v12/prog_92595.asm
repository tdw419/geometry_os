; DESCRIPTION: Draws a yellow rectangle at (78, 44) with width 116 and height 36.
; PLAN: r0=78(x), r1=44(y), r2=116(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 44
LDI r2, 116
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
