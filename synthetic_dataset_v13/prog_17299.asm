; DESCRIPTION: Draws a orange rectangle at (244, 19) with width 83 and height 86.
; PLAN: r0=244(x), r1=19(y), r2=83(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 19
LDI r2, 83
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
