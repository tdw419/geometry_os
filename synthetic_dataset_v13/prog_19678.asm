; DESCRIPTION: Draws a orange rectangle at (383, 76) with width 39 and height 97.
; PLAN: r0=383(x), r1=76(y), r2=39(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 76
LDI r2, 39
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
