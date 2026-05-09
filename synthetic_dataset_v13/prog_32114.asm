; DESCRIPTION: Places a purple 15x13 rectangle at position (156, 42).
; PLAN: r0=156(x), r1=42(y), r2=15(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 42
LDI r2, 15
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
