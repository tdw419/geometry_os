; DESCRIPTION: Draws a orange rectangle at (360, 98) with width 97 and height 18.
; PLAN: r0=360(x), r1=98(y), r2=97(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 98
LDI r2, 97
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
