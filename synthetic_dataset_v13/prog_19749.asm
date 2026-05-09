; DESCRIPTION: Draws a yellow rectangle at (347, 1) with width 64 and height 58.
; PLAN: r0=347(x), r1=1(y), r2=64(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 1
LDI r2, 64
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
