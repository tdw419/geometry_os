; DESCRIPTION: Draws a orange rectangle at (245, 133) with width 35 and height 14.
; PLAN: r0=245(x), r1=133(y), r2=35(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 133
LDI r2, 35
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
