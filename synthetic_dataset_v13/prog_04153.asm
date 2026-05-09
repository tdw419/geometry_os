; DESCRIPTION: Places a purple 82x57 rectangle at position (141, 87).
; PLAN: r0=141(x), r1=87(y), r2=82(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 87
LDI r2, 82
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
