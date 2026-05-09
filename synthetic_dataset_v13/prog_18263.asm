; DESCRIPTION: Places a purple 93x19 rectangle at position (231, 115).
; PLAN: r0=231(x), r1=115(y), r2=93(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 115
LDI r2, 93
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
