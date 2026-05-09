; DESCRIPTION: Places a purple 63x93 rectangle at position (258, 126).
; PLAN: r0=258(x), r1=126(y), r2=63(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 126
LDI r2, 63
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
