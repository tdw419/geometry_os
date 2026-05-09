; DESCRIPTION: Draws a black rectangle at (80, 241) with width 114 and height 10.
; PLAN: r0=80(x), r1=241(y), r2=114(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 241
LDI r2, 114
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
