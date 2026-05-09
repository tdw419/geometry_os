; DESCRIPTION: Draws a orange rectangle at (261, 189) with width 14 and height 53.
; PLAN: r0=261(x), r1=189(y), r2=14(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 189
LDI r2, 14
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
