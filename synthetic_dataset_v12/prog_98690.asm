; DESCRIPTION: Places a purple 94x45 rectangle at position (23, 22).
; PLAN: r0=23(x), r1=22(y), r2=94(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 22
LDI r2, 94
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
