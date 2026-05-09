; DESCRIPTION: Draws a black rectangle at (250, 35) with width 107 and height 92.
; PLAN: r0=250(x), r1=35(y), r2=107(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 35
LDI r2, 107
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
