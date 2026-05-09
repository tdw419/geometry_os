; DESCRIPTION: Places a purple 73x76 rectangle at position (87, 14).
; PLAN: r0=87(x), r1=14(y), r2=73(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 14
LDI r2, 73
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
