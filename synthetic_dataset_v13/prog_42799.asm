; DESCRIPTION: Places a black 82x42 rectangle at position (419, 191).
; PLAN: r0=419(x), r1=191(y), r2=82(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 191
LDI r2, 82
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
