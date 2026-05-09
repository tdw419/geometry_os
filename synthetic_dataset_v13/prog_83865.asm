; DESCRIPTION: Draws a cyan rectangle at (114, 75) with width 102 and height 84.
; PLAN: r0=114(x), r1=75(y), r2=102(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 75
LDI r2, 102
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
