; DESCRIPTION: Places a purple 30x72 rectangle at position (258, 39).
; PLAN: r0=258(x), r1=39(y), r2=30(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 39
LDI r2, 30
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
