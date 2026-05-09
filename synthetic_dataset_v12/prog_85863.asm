; DESCRIPTION: Places a purple 94x103 rectangle at position (161, 24).
; PLAN: r0=161(x), r1=24(y), r2=94(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 24
LDI r2, 94
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
