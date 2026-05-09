; DESCRIPTION: Draws a orange rectangle at (129, 13) with width 108 and height 60.
; PLAN: r0=129(x), r1=13(y), r2=108(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 13
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
