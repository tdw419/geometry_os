; DESCRIPTION: Draws a black rectangle at (221, 133) with width 96 and height 45.
; PLAN: r0=221(x), r1=133(y), r2=96(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 133
LDI r2, 96
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
