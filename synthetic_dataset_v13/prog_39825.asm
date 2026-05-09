; DESCRIPTION: Draws a orange rectangle at (378, 108) with width 23 and height 33.
; PLAN: r0=378(x), r1=108(y), r2=23(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 108
LDI r2, 23
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
