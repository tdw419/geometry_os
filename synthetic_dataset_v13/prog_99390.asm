; DESCRIPTION: Places a purple 37x94 rectangle at position (231, 146).
; PLAN: r0=231(x), r1=146(y), r2=37(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 146
LDI r2, 37
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
