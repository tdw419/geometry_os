; DESCRIPTION: Draws a green rectangle at (235, 45) with width 58 and height 101.
; PLAN: r0=235(x), r1=45(y), r2=58(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 45
LDI r2, 58
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
