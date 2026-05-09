; DESCRIPTION: Draws a orange rectangle at (260, 86) with width 119 and height 95.
; PLAN: r0=260(x), r1=86(y), r2=119(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 86
LDI r2, 119
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
