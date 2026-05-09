; DESCRIPTION: Places a purple 15x78 rectangle at position (5, 78).
; PLAN: r0=5(x), r1=78(y), r2=15(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 78
LDI r2, 15
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
