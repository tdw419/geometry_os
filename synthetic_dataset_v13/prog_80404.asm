; DESCRIPTION: Draws a yellow rectangle at (226, 60) with width 115 and height 84.
; PLAN: r0=226(x), r1=60(y), r2=115(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 60
LDI r2, 115
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
