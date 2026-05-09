; DESCRIPTION: Draws a orange rectangle at (174, 58) with width 26 and height 117.
; PLAN: r0=174(x), r1=58(y), r2=26(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 58
LDI r2, 26
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
