; DESCRIPTION: Draws a orange rectangle at (75, 89) with width 104 and height 14.
; PLAN: r0=75(x), r1=89(y), r2=104(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 89
LDI r2, 104
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
