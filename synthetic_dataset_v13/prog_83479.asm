; DESCRIPTION: Places a red 101x81 rectangle at position (292, 115).
; PLAN: r0=292(x), r1=115(y), r2=101(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 115
LDI r2, 101
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
