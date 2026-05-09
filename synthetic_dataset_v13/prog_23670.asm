; DESCRIPTION: Places a black 74x58 rectangle at position (31, 120).
; PLAN: r0=31(x), r1=120(y), r2=74(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 120
LDI r2, 74
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
