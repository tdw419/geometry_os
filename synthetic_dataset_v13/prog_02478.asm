; DESCRIPTION: Draws a cyan rectangle at (300, 156) with width 119 and height 94.
; PLAN: r0=300(x), r1=156(y), r2=119(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 156
LDI r2, 119
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
