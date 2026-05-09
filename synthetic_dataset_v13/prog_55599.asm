; DESCRIPTION: Draws a black rectangle at (235, 98) with width 81 and height 55.
; PLAN: r0=235(x), r1=98(y), r2=81(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 98
LDI r2, 81
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
