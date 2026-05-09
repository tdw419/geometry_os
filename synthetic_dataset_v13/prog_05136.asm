; DESCRIPTION: Draws a cyan rectangle at (309, 97) with width 25 and height 74.
; PLAN: r0=309(x), r1=97(y), r2=25(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 97
LDI r2, 25
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
