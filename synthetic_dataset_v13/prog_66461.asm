; DESCRIPTION: Draws a yellow rectangle at (335, 44) with width 114 and height 31.
; PLAN: r0=335(x), r1=44(y), r2=114(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 44
LDI r2, 114
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
