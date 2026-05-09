; DESCRIPTION: Places a black 100x87 rectangle at position (180, 58).
; PLAN: r0=180(x), r1=58(y), r2=100(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 58
LDI r2, 100
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
