; DESCRIPTION: Places a purple 65x60 rectangle at position (326, 170).
; PLAN: r0=326(x), r1=170(y), r2=65(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 170
LDI r2, 65
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
