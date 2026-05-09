; DESCRIPTION: Draws a black rectangle at (341, 96) with width 58 and height 57.
; PLAN: r0=341(x), r1=96(y), r2=58(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 96
LDI r2, 58
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
