; DESCRIPTION: Renders a black box of size 89x92 starting at (208, 116).
; PLAN: r0=208(x), r1=116(y), r2=89(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 116
LDI r2, 89
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
