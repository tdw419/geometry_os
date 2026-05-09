; DESCRIPTION: Draws a cyan rectangle at (162, 99) with width 118 and height 109.
; PLAN: r0=162(x), r1=99(y), r2=118(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 99
LDI r2, 118
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
