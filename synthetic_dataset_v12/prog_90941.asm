; DESCRIPTION: Draws a yellow rectangle at (263, 105) with width 58 and height 72.
; PLAN: r0=263(x), r1=105(y), r2=58(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 105
LDI r2, 58
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
