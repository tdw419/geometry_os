; DESCRIPTION: Places a black 51x92 rectangle at position (194, 25).
; PLAN: r0=194(x), r1=25(y), r2=51(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 25
LDI r2, 51
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
