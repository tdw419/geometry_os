; DESCRIPTION: Draws a cyan rectangle at (419, 123) with width 14 and height 35.
; PLAN: r0=419(x), r1=123(y), r2=14(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 123
LDI r2, 14
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
