; DESCRIPTION: Draws a black rectangle at (221, 153) with width 71 and height 92.
; PLAN: r0=221(x), r1=153(y), r2=71(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 153
LDI r2, 71
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
