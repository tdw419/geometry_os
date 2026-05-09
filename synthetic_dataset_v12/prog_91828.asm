; DESCRIPTION: Draws a cyan rectangle at (167, 94) with width 119 and height 109.
; PLAN: r0=167(x), r1=94(y), r2=119(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 94
LDI r2, 119
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
