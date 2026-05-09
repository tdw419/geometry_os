; DESCRIPTION: Draws a cyan rectangle at (191, 118) with width 54 and height 68.
; PLAN: r0=191(x), r1=118(y), r2=54(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 118
LDI r2, 54
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
