; DESCRIPTION: Draws a cyan rectangle at (104, 66) with width 104 and height 115.
; PLAN: r0=104(x), r1=66(y), r2=104(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 66
LDI r2, 104
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
