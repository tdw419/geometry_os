; DESCRIPTION: Draws a orange rectangle at (85, 104) with width 49 and height 86.
; PLAN: r0=85(x), r1=104(y), r2=49(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 104
LDI r2, 49
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
