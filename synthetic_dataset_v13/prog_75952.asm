; DESCRIPTION: Places a black 60x119 rectangle at position (151, 42).
; PLAN: r0=151(x), r1=42(y), r2=60(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 42
LDI r2, 60
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
