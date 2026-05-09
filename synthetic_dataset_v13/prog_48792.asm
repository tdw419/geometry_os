; DESCRIPTION: Places a white 93x79 rectangle at position (115, 81).
; PLAN: r0=115(x), r1=81(y), r2=93(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 81
LDI r2, 93
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
