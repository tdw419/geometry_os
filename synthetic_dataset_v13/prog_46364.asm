; DESCRIPTION: Places a magenta 67x10 rectangle at position (201, 42).
; PLAN: r0=201(x), r1=42(y), r2=67(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 42
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
