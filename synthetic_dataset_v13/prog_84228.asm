; DESCRIPTION: Renders a red box of size 73x51 starting at (24, 61).
; PLAN: r0=24(x), r1=61(y), r2=73(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 61
LDI r2, 73
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
