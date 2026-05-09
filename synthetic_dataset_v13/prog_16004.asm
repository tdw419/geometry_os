; DESCRIPTION: Draws a red rectangle at (201, 35) with width 44 and height 108.
; PLAN: r0=201(x), r1=35(y), r2=44(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 35
LDI r2, 44
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
