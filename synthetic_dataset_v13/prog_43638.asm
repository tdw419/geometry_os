; DESCRIPTION: Draws a black rectangle at (414, 91) with width 10 and height 92.
; PLAN: r0=414(x), r1=91(y), r2=10(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 91
LDI r2, 10
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
