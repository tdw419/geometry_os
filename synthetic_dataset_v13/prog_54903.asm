; DESCRIPTION: Draws a yellow rectangle at (180, 86) with width 116 and height 88.
; PLAN: r0=180(x), r1=86(y), r2=116(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 86
LDI r2, 116
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
