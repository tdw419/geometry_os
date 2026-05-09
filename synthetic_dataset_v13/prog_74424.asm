; DESCRIPTION: Places a red 77x79 rectangle at position (73, 51).
; PLAN: r0=73(x), r1=51(y), r2=77(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 51
LDI r2, 77
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
