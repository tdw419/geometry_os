; DESCRIPTION: Renders a black box of size 77x92 starting at (316, 28).
; PLAN: r0=316(x), r1=28(y), r2=77(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 28
LDI r2, 77
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
