; DESCRIPTION: Places a green 42x120 rectangle at position (93, 85).
; PLAN: r0=93(x), r1=85(y), r2=42(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 85
LDI r2, 42
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
