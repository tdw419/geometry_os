; DESCRIPTION: Places a purple 27x101 rectangle at position (61, 133).
; PLAN: r0=61(x), r1=133(y), r2=27(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 133
LDI r2, 27
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
