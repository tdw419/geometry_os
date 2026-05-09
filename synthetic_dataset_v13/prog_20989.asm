; DESCRIPTION: Draws a cyan rectangle at (149, 101) with width 26 and height 106.
; PLAN: r0=149(x), r1=101(y), r2=26(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 101
LDI r2, 26
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
