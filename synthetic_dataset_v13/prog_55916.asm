; DESCRIPTION: Places a purple 94x79 rectangle at position (329, 170).
; PLAN: r0=329(x), r1=170(y), r2=94(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 170
LDI r2, 94
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
