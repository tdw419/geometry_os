; DESCRIPTION: Draws a cyan rectangle at (430, 162) with width 31 and height 80.
; PLAN: r0=430(x), r1=162(y), r2=31(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 162
LDI r2, 31
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
