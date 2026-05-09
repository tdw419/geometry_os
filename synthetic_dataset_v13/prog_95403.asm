; DESCRIPTION: Draws a yellow rectangle at (184, 153) with width 116 and height 49.
; PLAN: r0=184(x), r1=153(y), r2=116(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 153
LDI r2, 116
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
