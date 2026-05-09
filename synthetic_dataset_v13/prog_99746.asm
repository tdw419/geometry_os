; DESCRIPTION: Draws a orange rectangle at (380, 174) with width 102 and height 44.
; PLAN: r0=380(x), r1=174(y), r2=102(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 174
LDI r2, 102
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
