; DESCRIPTION: Draws a cyan rectangle at (339, 110) with width 99 and height 76.
; PLAN: r0=339(x), r1=110(y), r2=99(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 110
LDI r2, 99
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
