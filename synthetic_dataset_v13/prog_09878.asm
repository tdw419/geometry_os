; DESCRIPTION: Places a purple 15x68 rectangle at position (326, 73).
; PLAN: r0=326(x), r1=73(y), r2=15(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 73
LDI r2, 15
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
