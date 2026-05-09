; DESCRIPTION: Draws a orange rectangle at (376, 28) with width 78 and height 84.
; PLAN: r0=376(x), r1=28(y), r2=78(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 28
LDI r2, 78
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
