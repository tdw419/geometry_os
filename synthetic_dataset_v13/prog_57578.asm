; DESCRIPTION: Draws a cyan rectangle at (241, 97) with width 66 and height 69.
; PLAN: r0=241(x), r1=97(y), r2=66(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 97
LDI r2, 66
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
