; DESCRIPTION: Places a orange 93x54 rectangle at position (275, 42).
; PLAN: r0=275(x), r1=42(y), r2=93(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 42
LDI r2, 93
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
