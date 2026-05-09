; DESCRIPTION: Places a purple 12x14 rectangle at position (58, 142).
; PLAN: r0=58(x), r1=142(y), r2=12(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 142
LDI r2, 12
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
