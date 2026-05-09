; DESCRIPTION: Places a red 51x56 rectangle at position (10, 96).
; PLAN: r0=10(x), r1=96(y), r2=51(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 96
LDI r2, 51
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
