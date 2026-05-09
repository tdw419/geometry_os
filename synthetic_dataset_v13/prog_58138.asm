; DESCRIPTION: Draws a cyan rectangle at (140, 148) with width 89 and height 106.
; PLAN: r0=140(x), r1=148(y), r2=89(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 148
LDI r2, 89
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
