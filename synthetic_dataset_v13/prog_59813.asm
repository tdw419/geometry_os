; DESCRIPTION: Places a purple 58x72 rectangle at position (337, 144).
; PLAN: r0=337(x), r1=144(y), r2=58(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 144
LDI r2, 58
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
