; DESCRIPTION: Draws a orange rectangle at (235, 226) with width 33 and height 24.
; PLAN: r0=235(x), r1=226(y), r2=33(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 226
LDI r2, 33
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
