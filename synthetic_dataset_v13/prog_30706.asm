; DESCRIPTION: Places a purple 87x58 rectangle at position (425, 142).
; PLAN: r0=425(x), r1=142(y), r2=87(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 142
LDI r2, 87
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
