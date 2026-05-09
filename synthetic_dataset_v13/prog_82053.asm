; DESCRIPTION: Draws a orange rectangle at (142, 17) with width 60 and height 116.
; PLAN: r0=142(x), r1=17(y), r2=60(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 17
LDI r2, 60
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
