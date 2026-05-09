; DESCRIPTION: Draws a orange rectangle at (8, 27) with width 80 and height 105.
; PLAN: r0=8(x), r1=27(y), r2=80(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 27
LDI r2, 80
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
