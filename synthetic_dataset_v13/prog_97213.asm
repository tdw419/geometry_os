; DESCRIPTION: Places a red 93x81 rectangle at position (282, 104).
; PLAN: r0=282(x), r1=104(y), r2=93(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 104
LDI r2, 93
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
