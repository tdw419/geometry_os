; DESCRIPTION: Places a purple 99x82 rectangle at position (371, 145).
; PLAN: r0=371(x), r1=145(y), r2=99(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 145
LDI r2, 99
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
