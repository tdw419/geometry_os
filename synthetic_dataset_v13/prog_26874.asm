; DESCRIPTION: Draws a cyan rectangle at (78, 194) with width 114 and height 26.
; PLAN: r0=78(x), r1=194(y), r2=114(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 194
LDI r2, 114
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
