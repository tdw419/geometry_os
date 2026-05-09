; DESCRIPTION: Places a yellow 101x69 rectangle at position (232, 42).
; PLAN: r0=232(x), r1=42(y), r2=101(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 42
LDI r2, 101
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
