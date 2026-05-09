; DESCRIPTION: Places a orange 108x52 rectangle at position (25, 42).
; PLAN: r0=25(x), r1=42(y), r2=108(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 42
LDI r2, 108
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
