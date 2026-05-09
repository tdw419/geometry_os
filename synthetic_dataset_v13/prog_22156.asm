; DESCRIPTION: Draws a orange rectangle at (245, 122) with width 111 and height 99.
; PLAN: r0=245(x), r1=122(y), r2=111(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 122
LDI r2, 111
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
