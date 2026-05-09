; DESCRIPTION: Draws a orange rectangle at (174, 174) with width 45 and height 34.
; PLAN: r0=174(x), r1=174(y), r2=45(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 174
LDI r2, 45
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
