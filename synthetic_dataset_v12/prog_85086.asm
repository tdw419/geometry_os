; DESCRIPTION: Places a purple 118x45 rectangle at position (392, 108).
; PLAN: r0=392(x), r1=108(y), r2=118(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 108
LDI r2, 118
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
