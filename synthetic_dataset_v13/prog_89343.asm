; DESCRIPTION: Places a red 14x118 rectangle at position (185, 45).
; PLAN: r0=185(x), r1=45(y), r2=14(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 45
LDI r2, 14
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
