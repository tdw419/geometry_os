; DESCRIPTION: Draws a yellow rectangle at (120, 199) with width 81 and height 43.
; PLAN: r0=120(x), r1=199(y), r2=81(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 199
LDI r2, 81
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
