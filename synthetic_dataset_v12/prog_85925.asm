; DESCRIPTION: Places a orange 42x93 rectangle at position (262, 77).
; PLAN: r0=262(x), r1=77(y), r2=42(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 77
LDI r2, 42
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
