; DESCRIPTION: Draws a orange rectangle at (376, 86) with width 62 and height 26.
; PLAN: r0=376(x), r1=86(y), r2=62(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 86
LDI r2, 62
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
