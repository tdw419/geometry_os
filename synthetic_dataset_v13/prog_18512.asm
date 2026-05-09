; DESCRIPTION: Draws a orange rectangle at (355, 38) with width 112 and height 108.
; PLAN: r0=355(x), r1=38(y), r2=112(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 38
LDI r2, 112
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
