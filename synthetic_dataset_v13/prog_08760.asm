; DESCRIPTION: Draws a orange rectangle at (298, 56) with width 97 and height 73.
; PLAN: r0=298(x), r1=56(y), r2=97(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 56
LDI r2, 97
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
