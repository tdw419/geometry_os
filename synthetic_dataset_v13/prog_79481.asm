; DESCRIPTION: Places a black 68x58 rectangle at position (60, 35).
; PLAN: r0=60(x), r1=35(y), r2=68(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 35
LDI r2, 68
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
