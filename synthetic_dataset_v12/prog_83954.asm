; DESCRIPTION: Draws a orange rectangle at (228, 105) with width 80 and height 15.
; PLAN: r0=228(x), r1=105(y), r2=80(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 105
LDI r2, 80
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
