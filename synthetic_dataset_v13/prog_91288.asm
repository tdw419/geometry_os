; DESCRIPTION: Places a purple 60x63 rectangle at position (62, 190).
; PLAN: r0=62(x), r1=190(y), r2=60(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 190
LDI r2, 60
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
