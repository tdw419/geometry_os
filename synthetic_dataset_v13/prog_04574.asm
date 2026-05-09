; DESCRIPTION: Places a black 57x103 rectangle at position (336, 93).
; PLAN: r0=336(x), r1=93(y), r2=57(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 93
LDI r2, 57
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
