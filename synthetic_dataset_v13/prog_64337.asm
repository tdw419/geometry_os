; DESCRIPTION: Places a purple 60x16 rectangle at position (268, 149).
; PLAN: r0=268(x), r1=149(y), r2=60(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 149
LDI r2, 60
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
