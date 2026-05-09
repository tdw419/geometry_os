; DESCRIPTION: Places a purple 15x20 rectangle at position (483, 228).
; PLAN: r0=483(x), r1=228(y), r2=15(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 228
LDI r2, 15
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
