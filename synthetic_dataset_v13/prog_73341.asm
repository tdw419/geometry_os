; DESCRIPTION: Places a purple 20x13 rectangle at position (452, 126).
; PLAN: r0=452(x), r1=126(y), r2=20(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 126
LDI r2, 20
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
