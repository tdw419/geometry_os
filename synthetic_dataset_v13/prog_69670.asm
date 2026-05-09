; DESCRIPTION: Draws a cyan rectangle at (312, 49) with width 97 and height 55.
; PLAN: r0=312(x), r1=49(y), r2=97(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 49
LDI r2, 97
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
