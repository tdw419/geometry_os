; DESCRIPTION: Draws a cyan rectangle at (66, 104) with width 70 and height 78.
; PLAN: r0=66(x), r1=104(y), r2=70(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 104
LDI r2, 70
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
