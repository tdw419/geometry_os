; DESCRIPTION: Draws a orange rectangle at (426, 101) with width 40 and height 93.
; PLAN: r0=426(x), r1=101(y), r2=40(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 101
LDI r2, 40
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
