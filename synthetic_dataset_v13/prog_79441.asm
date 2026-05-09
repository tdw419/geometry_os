; DESCRIPTION: Places a purple 17x53 rectangle at position (356, 40).
; PLAN: r0=356(x), r1=40(y), r2=17(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 40
LDI r2, 17
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
