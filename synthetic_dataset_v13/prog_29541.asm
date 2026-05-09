; DESCRIPTION: Places a purple 42x40 rectangle at position (338, 201).
; PLAN: r0=338(x), r1=201(y), r2=42(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 201
LDI r2, 42
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
