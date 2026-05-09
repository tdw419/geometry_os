; DESCRIPTION: Places a purple 14x87 rectangle at position (117, 160).
; PLAN: r0=117(x), r1=160(y), r2=14(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 160
LDI r2, 14
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
