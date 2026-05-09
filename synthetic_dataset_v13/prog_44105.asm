; DESCRIPTION: Draws a cyan rectangle at (31, 4) with width 119 and height 65.
; PLAN: r0=31(x), r1=4(y), r2=119(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 4
LDI r2, 119
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
