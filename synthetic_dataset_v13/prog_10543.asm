; DESCRIPTION: Draws a orange rectangle at (339, 86) with width 58 and height 98.
; PLAN: r0=339(x), r1=86(y), r2=58(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 86
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
