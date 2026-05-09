; DESCRIPTION: Draws a orange rectangle at (292, 31) with width 47 and height 14.
; PLAN: r0=292(x), r1=31(y), r2=47(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 31
LDI r2, 47
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
