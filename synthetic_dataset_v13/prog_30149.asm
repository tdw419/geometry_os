; DESCRIPTION: Places a purple 68x101 rectangle at position (442, 32).
; PLAN: r0=442(x), r1=32(y), r2=68(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 32
LDI r2, 68
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
