; DESCRIPTION: Places a purple 13x76 rectangle at position (22, 35).
; PLAN: r0=22(x), r1=35(y), r2=13(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 35
LDI r2, 13
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
