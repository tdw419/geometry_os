; DESCRIPTION: Places a purple 81x38 rectangle at position (315, 201).
; PLAN: r0=315(x), r1=201(y), r2=81(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 201
LDI r2, 81
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
