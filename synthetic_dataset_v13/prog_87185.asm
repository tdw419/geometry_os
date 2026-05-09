; DESCRIPTION: Draws a black rectangle at (114, 139) with width 61 and height 10.
; PLAN: r0=114(x), r1=139(y), r2=61(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 139
LDI r2, 61
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
