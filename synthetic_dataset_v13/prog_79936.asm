; DESCRIPTION: Places a purple 60x94 rectangle at position (46, 143).
; PLAN: r0=46(x), r1=143(y), r2=60(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 143
LDI r2, 60
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
