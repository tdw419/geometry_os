; DESCRIPTION: Places a red 51x13 rectangle at position (119, 93).
; PLAN: r0=119(x), r1=93(y), r2=51(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 93
LDI r2, 51
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
