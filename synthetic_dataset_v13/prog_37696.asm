; DESCRIPTION: Draws a orange rectangle at (388, 114) with width 80 and height 53.
; PLAN: r0=388(x), r1=114(y), r2=80(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 114
LDI r2, 80
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
