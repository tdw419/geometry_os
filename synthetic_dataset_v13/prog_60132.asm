; DESCRIPTION: Places a black 87x81 rectangle at position (248, 25).
; PLAN: r0=248(x), r1=25(y), r2=87(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 25
LDI r2, 87
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
