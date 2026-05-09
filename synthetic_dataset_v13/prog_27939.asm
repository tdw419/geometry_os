; DESCRIPTION: Draws a orange rectangle at (124, 62) with width 79 and height 18.
; PLAN: r0=124(x), r1=62(y), r2=79(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 62
LDI r2, 79
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
