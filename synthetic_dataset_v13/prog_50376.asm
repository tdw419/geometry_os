; DESCRIPTION: Places a black 82x95 rectangle at position (311, 128).
; PLAN: r0=311(x), r1=128(y), r2=82(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 128
LDI r2, 82
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
