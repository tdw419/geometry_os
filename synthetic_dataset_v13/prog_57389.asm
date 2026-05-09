; DESCRIPTION: Places a purple 101x118 rectangle at position (64, 8).
; PLAN: r0=64(x), r1=8(y), r2=101(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 8
LDI r2, 101
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
