; DESCRIPTION: Draws a orange rectangle at (54, 105) with width 86 and height 86.
; PLAN: r0=54(x), r1=105(y), r2=86(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 105
LDI r2, 86
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
