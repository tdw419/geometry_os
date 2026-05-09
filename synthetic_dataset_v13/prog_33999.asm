; DESCRIPTION: Places a purple 58x109 rectangle at position (93, 81).
; PLAN: r0=93(x), r1=81(y), r2=58(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 81
LDI r2, 58
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
