; DESCRIPTION: Places a purple 86x89 rectangle at position (42, 60).
; PLAN: r0=42(x), r1=60(y), r2=86(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 60
LDI r2, 86
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
