; DESCRIPTION: Draws a black rectangle at (401, 153) with width 101 and height 17.
; PLAN: r0=401(x), r1=153(y), r2=101(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 153
LDI r2, 101
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
