; DESCRIPTION: Draws a orange rectangle at (342, 79) with width 43 and height 117.
; PLAN: r0=342(x), r1=79(y), r2=43(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 79
LDI r2, 43
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
