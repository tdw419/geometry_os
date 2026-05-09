; DESCRIPTION: Places a purple 89x19 rectangle at position (90, 36).
; PLAN: r0=90(x), r1=36(y), r2=89(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 36
LDI r2, 89
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
