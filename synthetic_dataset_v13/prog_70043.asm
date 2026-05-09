; DESCRIPTION: Places a purple 30x118 rectangle at position (363, 0).
; PLAN: r0=363(x), r1=0(y), r2=30(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 0
LDI r2, 30
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
