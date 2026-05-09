; DESCRIPTION: Draws a orange rectangle at (114, 94) with width 21 and height 21.
; PLAN: r0=114(x), r1=94(y), r2=21(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 94
LDI r2, 21
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
