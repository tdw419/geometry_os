; DESCRIPTION: Draws a black rectangle at (92, 69) with width 105 and height 100.
; PLAN: r0=92(x), r1=69(y), r2=105(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 69
LDI r2, 105
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
