; DESCRIPTION: Draws a orange rectangle at (22, 61) with width 63 and height 86.
; PLAN: r0=22(x), r1=61(y), r2=63(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 61
LDI r2, 63
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
