; DESCRIPTION: Draws a orange rectangle at (218, 53) with width 108 and height 23.
; PLAN: r0=218(x), r1=53(y), r2=108(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 53
LDI r2, 108
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
