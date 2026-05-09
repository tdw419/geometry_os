; DESCRIPTION: Draws a cyan rectangle at (40, 97) with width 68 and height 117.
; PLAN: r0=40(x), r1=97(y), r2=68(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 97
LDI r2, 68
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
