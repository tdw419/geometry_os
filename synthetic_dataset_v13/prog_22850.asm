; DESCRIPTION: Draws a orange rectangle at (235, 161) with width 69 and height 86.
; PLAN: r0=235(x), r1=161(y), r2=69(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 161
LDI r2, 69
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
