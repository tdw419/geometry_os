; DESCRIPTION: Draws a orange rectangle at (233, 58) with width 20 and height 108.
; PLAN: r0=233(x), r1=58(y), r2=20(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 58
LDI r2, 20
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
