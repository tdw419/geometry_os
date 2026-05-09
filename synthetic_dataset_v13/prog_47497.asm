; DESCRIPTION: Places a orange 42x27 rectangle at position (85, 30).
; PLAN: r0=85(x), r1=30(y), r2=42(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 30
LDI r2, 42
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
