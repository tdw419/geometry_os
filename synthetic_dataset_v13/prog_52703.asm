; DESCRIPTION: Places a purple 116x120 rectangle at position (120, 31).
; PLAN: r0=120(x), r1=31(y), r2=116(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 31
LDI r2, 116
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
