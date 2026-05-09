; DESCRIPTION: Draws a yellow rectangle at (127, 17) with width 116 and height 10.
; PLAN: r0=127(x), r1=17(y), r2=116(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 17
LDI r2, 116
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
