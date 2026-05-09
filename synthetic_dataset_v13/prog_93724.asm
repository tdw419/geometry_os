; DESCRIPTION: Draws a orange rectangle at (334, 161) with width 36 and height 39.
; PLAN: r0=334(x), r1=161(y), r2=36(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 161
LDI r2, 36
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
