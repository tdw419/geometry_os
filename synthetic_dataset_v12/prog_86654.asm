; DESCRIPTION: Places a black 14x78 rectangle at position (7, 85).
; PLAN: r0=7(x), r1=85(y), r2=14(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 85
LDI r2, 14
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
