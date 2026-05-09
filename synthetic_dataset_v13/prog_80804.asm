; DESCRIPTION: Draws a yellow rectangle at (196, 125) with width 100 and height 116.
; PLAN: r0=196(x), r1=125(y), r2=100(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 125
LDI r2, 100
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
