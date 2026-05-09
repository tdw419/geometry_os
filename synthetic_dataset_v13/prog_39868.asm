; DESCRIPTION: Draws a yellow rectangle at (376, 58) with width 112 and height 90.
; PLAN: r0=376(x), r1=58(y), r2=112(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 58
LDI r2, 112
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
