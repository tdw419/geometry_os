; DESCRIPTION: Draws a yellow rectangle at (102, 175) with width 97 and height 61.
; PLAN: r0=102(x), r1=175(y), r2=97(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 175
LDI r2, 97
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
