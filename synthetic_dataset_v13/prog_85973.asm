; DESCRIPTION: Renders a black box of size 73x57 starting at (59, 51).
; PLAN: r0=59(x), r1=51(y), r2=73(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 51
LDI r2, 73
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
