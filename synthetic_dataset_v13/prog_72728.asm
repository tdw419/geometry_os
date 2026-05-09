; DESCRIPTION: Places a green 42x93 rectangle at position (18, 47).
; PLAN: r0=18(x), r1=47(y), r2=42(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 47
LDI r2, 42
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
