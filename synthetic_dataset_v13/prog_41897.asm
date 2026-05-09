; DESCRIPTION: Places a purple 52x101 rectangle at position (322, 126).
; PLAN: r0=322(x), r1=126(y), r2=52(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 126
LDI r2, 52
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
