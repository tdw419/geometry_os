; DESCRIPTION: Places a orange 116x61 rectangle at position (216, 51).
; PLAN: r0=216(x), r1=51(y), r2=116(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 51
LDI r2, 116
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
