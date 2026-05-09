; DESCRIPTION: Places a purple 14x88 rectangle at position (308, 143).
; PLAN: r0=308(x), r1=143(y), r2=14(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 143
LDI r2, 14
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
