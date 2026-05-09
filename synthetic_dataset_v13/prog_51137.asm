; DESCRIPTION: Draws a orange rectangle at (235, 89) with width 53 and height 55.
; PLAN: r0=235(x), r1=89(y), r2=53(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 89
LDI r2, 53
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
