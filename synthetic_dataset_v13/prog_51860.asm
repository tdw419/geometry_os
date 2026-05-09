; DESCRIPTION: Draws a orange rectangle at (123, 49) with width 87 and height 86.
; PLAN: r0=123(x), r1=49(y), r2=87(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 49
LDI r2, 87
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
