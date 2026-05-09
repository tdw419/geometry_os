; DESCRIPTION: Draws a orange rectangle at (495, 63) with width 17 and height 60.
; PLAN: r0=495(x), r1=63(y), r2=17(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 63
LDI r2, 17
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
