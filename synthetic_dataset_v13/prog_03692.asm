; DESCRIPTION: Renders a green box of size 44x114 starting at (74, 97).
; PLAN: r0=74(x), r1=97(y), r2=44(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 97
LDI r2, 44
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
