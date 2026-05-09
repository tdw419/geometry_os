; DESCRIPTION: Draws a orange rectangle at (97, 74) with width 107 and height 27.
; PLAN: r0=97(x), r1=74(y), r2=107(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 74
LDI r2, 107
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
