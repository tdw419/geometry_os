; DESCRIPTION: Draws a cyan rectangle at (189, 164) with width 97 and height 89.
; PLAN: r0=189(x), r1=164(y), r2=97(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 164
LDI r2, 97
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
