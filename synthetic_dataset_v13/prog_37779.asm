; DESCRIPTION: Draws a black rectangle at (319, 233) with width 92 and height 10.
; PLAN: r0=319(x), r1=233(y), r2=92(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 233
LDI r2, 92
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
