; DESCRIPTION: Places a purple 17x29 rectangle at position (418, 30).
; PLAN: r0=418(x), r1=30(y), r2=17(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 30
LDI r2, 17
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
