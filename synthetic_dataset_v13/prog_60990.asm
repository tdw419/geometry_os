; DESCRIPTION: Draws a black rectangle at (235, 59) with width 98 and height 88.
; PLAN: r0=235(x), r1=59(y), r2=98(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 59
LDI r2, 98
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
