; DESCRIPTION: Draws a orange rectangle at (104, 7) with width 56 and height 49.
; PLAN: r0=104(x), r1=7(y), r2=56(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 7
LDI r2, 56
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
