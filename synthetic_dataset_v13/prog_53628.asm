; DESCRIPTION: Places a red 33x96 rectangle at position (93, 148).
; PLAN: r0=93(x), r1=148(y), r2=33(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 148
LDI r2, 33
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
