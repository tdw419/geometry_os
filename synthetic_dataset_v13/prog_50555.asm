; DESCRIPTION: Draws a black rectangle at (259, 68) with width 92 and height 92.
; PLAN: r0=259(x), r1=68(y), r2=92(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 68
LDI r2, 92
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
