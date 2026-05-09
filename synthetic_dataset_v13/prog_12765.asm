; DESCRIPTION: Draws a orange rectangle at (104, 117) with width 66 and height 77.
; PLAN: r0=104(x), r1=117(y), r2=66(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 117
LDI r2, 66
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
