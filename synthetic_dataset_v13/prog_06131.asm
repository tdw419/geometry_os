; DESCRIPTION: Draws a orange rectangle at (31, 56) with width 13 and height 103.
; PLAN: r0=31(x), r1=56(y), r2=13(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 56
LDI r2, 13
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
