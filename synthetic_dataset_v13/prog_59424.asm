; DESCRIPTION: Draws a black rectangle at (113, 145) with width 58 and height 83.
; PLAN: r0=113(x), r1=145(y), r2=58(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 145
LDI r2, 58
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
