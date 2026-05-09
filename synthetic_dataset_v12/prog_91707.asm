; DESCRIPTION: Places a purple 105x93 rectangle at position (164, 128).
; PLAN: r0=164(x), r1=128(y), r2=105(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 128
LDI r2, 105
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
