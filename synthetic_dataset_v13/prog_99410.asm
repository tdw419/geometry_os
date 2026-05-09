; DESCRIPTION: Places a purple 14x85 rectangle at position (496, 142).
; PLAN: r0=496(x), r1=142(y), r2=14(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 142
LDI r2, 14
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
