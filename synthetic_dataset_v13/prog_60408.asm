; DESCRIPTION: Draws a black rectangle at (347, 28) with width 68 and height 33.
; PLAN: r0=347(x), r1=28(y), r2=68(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 28
LDI r2, 68
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
