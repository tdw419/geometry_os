; DESCRIPTION: Draws a orange rectangle at (325, 34) with width 93 and height 93.
; PLAN: r0=325(x), r1=34(y), r2=93(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 34
LDI r2, 93
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
