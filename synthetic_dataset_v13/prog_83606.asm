; DESCRIPTION: Draws a orange rectangle at (31, 20) with width 58 and height 108.
; PLAN: r0=31(x), r1=20(y), r2=58(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 20
LDI r2, 58
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
