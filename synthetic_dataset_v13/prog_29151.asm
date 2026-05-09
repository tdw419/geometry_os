; DESCRIPTION: Draws a orange rectangle at (161, 4) with width 26 and height 71.
; PLAN: r0=161(x), r1=4(y), r2=26(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 4
LDI r2, 26
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
