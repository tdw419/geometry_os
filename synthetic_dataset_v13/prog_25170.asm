; DESCRIPTION: Draws a black rectangle at (357, 92) with width 61 and height 31.
; PLAN: r0=357(x), r1=92(y), r2=61(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 92
LDI r2, 61
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
