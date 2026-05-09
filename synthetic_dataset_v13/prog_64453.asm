; DESCRIPTION: Draws a black rectangle at (68, 14) with width 87 and height 44.
; PLAN: r0=68(x), r1=14(y), r2=87(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 14
LDI r2, 87
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
