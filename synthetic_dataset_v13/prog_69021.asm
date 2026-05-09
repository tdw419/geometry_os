; DESCRIPTION: Draws a yellow rectangle at (116, 13) with width 73 and height 30.
; PLAN: r0=116(x), r1=13(y), r2=73(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 13
LDI r2, 73
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
