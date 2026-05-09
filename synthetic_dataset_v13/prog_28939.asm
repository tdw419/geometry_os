; DESCRIPTION: Draws a orange rectangle at (235, 142) with width 61 and height 79.
; PLAN: r0=235(x), r1=142(y), r2=61(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 142
LDI r2, 61
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
