; DESCRIPTION: Draws a orange rectangle at (380, 23) with width 58 and height 33.
; PLAN: r0=380(x), r1=23(y), r2=58(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 23
LDI r2, 58
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
