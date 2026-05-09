; DESCRIPTION: Draws a orange rectangle at (151, 8) with width 53 and height 118.
; PLAN: r0=151(x), r1=8(y), r2=53(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 8
LDI r2, 53
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
