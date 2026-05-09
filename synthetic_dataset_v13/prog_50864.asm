; DESCRIPTION: Draws a orange rectangle at (311, 124) with width 41 and height 72.
; PLAN: r0=311(x), r1=124(y), r2=41(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 124
LDI r2, 41
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
