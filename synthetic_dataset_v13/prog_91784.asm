; DESCRIPTION: Places a purple 36x92 rectangle at position (51, 11).
; PLAN: r0=51(x), r1=11(y), r2=36(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 11
LDI r2, 36
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
