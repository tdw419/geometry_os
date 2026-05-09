; DESCRIPTION: Places a orange 100x14 rectangle at position (42, 31).
; PLAN: r0=42(x), r1=31(y), r2=100(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 31
LDI r2, 100
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
