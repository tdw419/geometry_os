; DESCRIPTION: Places a purple 17x76 rectangle at position (137, 161).
; PLAN: r0=137(x), r1=161(y), r2=17(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 161
LDI r2, 17
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
