; DESCRIPTION: Places a black 94x110 rectangle at position (195, 74).
; PLAN: r0=195(x), r1=74(y), r2=94(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 74
LDI r2, 94
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
