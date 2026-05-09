; DESCRIPTION: Places a purple 66x94 rectangle at position (375, 44).
; PLAN: r0=375(x), r1=44(y), r2=66(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 44
LDI r2, 66
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
