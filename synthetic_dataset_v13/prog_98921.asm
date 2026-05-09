; DESCRIPTION: Places a red 92x88 rectangle at position (399, 51).
; PLAN: r0=399(x), r1=51(y), r2=92(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 51
LDI r2, 92
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
