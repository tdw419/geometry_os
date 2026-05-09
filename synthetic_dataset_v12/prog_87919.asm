; DESCRIPTION: Places a purple 116x60 rectangle at position (221, 130).
; PLAN: r0=221(x), r1=130(y), r2=116(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 130
LDI r2, 116
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
