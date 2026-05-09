; DESCRIPTION: Draws a cyan rectangle at (157, 145) with width 110 and height 90.
; PLAN: r0=157(x), r1=145(y), r2=110(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 145
LDI r2, 110
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
