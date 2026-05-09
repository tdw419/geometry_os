; DESCRIPTION: Draws a black rectangle at (206, 135) with width 102 and height 92.
; PLAN: r0=206(x), r1=135(y), r2=102(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 135
LDI r2, 102
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
