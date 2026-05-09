; DESCRIPTION: Places a white 68x51 rectangle at position (131, 99).
; PLAN: r0=131(x), r1=99(y), r2=68(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 99
LDI r2, 68
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
