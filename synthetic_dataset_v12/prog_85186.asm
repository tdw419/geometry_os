; DESCRIPTION: Draws a orange rectangle at (181, 103) with width 87 and height 36.
; PLAN: r0=181(x), r1=103(y), r2=87(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 103
LDI r2, 87
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
