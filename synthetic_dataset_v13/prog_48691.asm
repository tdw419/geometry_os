; DESCRIPTION: Draws a orange rectangle at (19, 108) with width 108 and height 59.
; PLAN: r0=19(x), r1=108(y), r2=108(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 108
LDI r2, 108
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
