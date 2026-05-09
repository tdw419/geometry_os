; DESCRIPTION: Places a blue 27x118 rectangle at position (308, 96).
; PLAN: r0=308(x), r1=96(y), r2=27(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 96
LDI r2, 27
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
