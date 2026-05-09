; DESCRIPTION: Renders a yellow box of size 116x116 starting at (51, 52).
; PLAN: r0=51(x), r1=52(y), r2=116(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 52
LDI r2, 116
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
