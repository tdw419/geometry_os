; DESCRIPTION: Draws a cyan rectangle at (349, 22) with width 104 and height 23.
; PLAN: r0=349(x), r1=22(y), r2=104(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 22
LDI r2, 104
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
