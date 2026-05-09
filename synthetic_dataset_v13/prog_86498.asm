; DESCRIPTION: Draws a black rectangle at (356, 131) with width 46 and height 114.
; PLAN: r0=356(x), r1=131(y), r2=46(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 131
LDI r2, 46
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
