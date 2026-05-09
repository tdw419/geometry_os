; DESCRIPTION: Places a cyan 42x119 rectangle at position (109, 116).
; PLAN: r0=109(x), r1=116(y), r2=42(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 116
LDI r2, 42
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
