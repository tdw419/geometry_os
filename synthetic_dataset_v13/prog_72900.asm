; DESCRIPTION: Places a purple 87x16 rectangle at position (44, 86).
; PLAN: r0=44(x), r1=86(y), r2=87(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 86
LDI r2, 87
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
