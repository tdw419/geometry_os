; DESCRIPTION: Places a purple 13x120 rectangle at position (200, 76).
; PLAN: r0=200(x), r1=76(y), r2=13(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 76
LDI r2, 13
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
