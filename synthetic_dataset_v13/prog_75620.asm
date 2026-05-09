; DESCRIPTION: Draws a cyan rectangle at (86, 66) with width 105 and height 94.
; PLAN: r0=86(x), r1=66(y), r2=105(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 66
LDI r2, 105
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
