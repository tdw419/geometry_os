; DESCRIPTION: Places a green 67x24 rectangle at position (123, 42).
; PLAN: r0=123(x), r1=42(y), r2=67(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 42
LDI r2, 67
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
