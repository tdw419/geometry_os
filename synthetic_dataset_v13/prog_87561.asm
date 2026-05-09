; DESCRIPTION: Draws a black rectangle at (347, 12) with width 45 and height 92.
; PLAN: r0=347(x), r1=12(y), r2=45(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 12
LDI r2, 45
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
