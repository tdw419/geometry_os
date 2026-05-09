; DESCRIPTION: Draws a yellow rectangle at (79, 116) with width 11 and height 49.
; PLAN: r0=79(x), r1=116(y), r2=11(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 116
LDI r2, 11
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
