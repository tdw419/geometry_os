; DESCRIPTION: Places a purple 15x99 rectangle at position (339, 0).
; PLAN: r0=339(x), r1=0(y), r2=15(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 0
LDI r2, 15
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
