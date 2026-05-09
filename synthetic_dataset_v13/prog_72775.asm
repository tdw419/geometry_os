; DESCRIPTION: Places a purple 21x78 rectangle at position (22, 26).
; PLAN: r0=22(x), r1=26(y), r2=21(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 26
LDI r2, 21
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
