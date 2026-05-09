; DESCRIPTION: Places a purple 36x93 rectangle at position (406, 45).
; PLAN: r0=406(x), r1=45(y), r2=36(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 45
LDI r2, 36
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
