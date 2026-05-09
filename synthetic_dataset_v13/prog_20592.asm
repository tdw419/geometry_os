; DESCRIPTION: Places a purple 70x83 rectangle at position (326, 161).
; PLAN: r0=326(x), r1=161(y), r2=70(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 161
LDI r2, 70
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
