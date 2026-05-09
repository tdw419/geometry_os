; DESCRIPTION: Draws a red rectangle at (51, 131) with width 92 and height 116.
; PLAN: r0=51(x), r1=131(y), r2=92(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 131
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
