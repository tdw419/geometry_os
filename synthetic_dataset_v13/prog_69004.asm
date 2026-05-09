; DESCRIPTION: Draws a orange rectangle at (214, 104) with width 104 and height 84.
; PLAN: r0=214(x), r1=104(y), r2=104(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 104
LDI r2, 104
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
