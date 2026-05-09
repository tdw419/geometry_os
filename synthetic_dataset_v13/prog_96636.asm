; DESCRIPTION: Draws a cyan rectangle at (90, 110) with width 70 and height 106.
; PLAN: r0=90(x), r1=110(y), r2=70(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 110
LDI r2, 70
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
