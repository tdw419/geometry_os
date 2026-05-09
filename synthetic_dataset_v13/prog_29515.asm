; DESCRIPTION: Draws a cyan rectangle at (349, 83) with width 78 and height 55.
; PLAN: r0=349(x), r1=83(y), r2=78(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 83
LDI r2, 78
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
