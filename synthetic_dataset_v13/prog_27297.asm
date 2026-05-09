; DESCRIPTION: Places a red 19x92 rectangle at position (448, 112).
; PLAN: r0=448(x), r1=112(y), r2=19(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 112
LDI r2, 19
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
