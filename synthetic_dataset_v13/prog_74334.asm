; DESCRIPTION: Places a purple 18x78 rectangle at position (483, 20).
; PLAN: r0=483(x), r1=20(y), r2=18(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 20
LDI r2, 18
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
