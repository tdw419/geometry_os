; DESCRIPTION: Places a red 95x118 rectangle at position (142, 62).
; PLAN: r0=142(x), r1=62(y), r2=95(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 62
LDI r2, 95
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
