; DESCRIPTION: Draws a orange rectangle at (120, 115) with width 56 and height 116.
; PLAN: r0=120(x), r1=115(y), r2=56(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 115
LDI r2, 56
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
