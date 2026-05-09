; DESCRIPTION: Draws a orange rectangle at (301, 89) with width 76 and height 83.
; PLAN: r0=301(x), r1=89(y), r2=76(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 89
LDI r2, 76
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
