; DESCRIPTION: Places a black 34x96 rectangle at position (58, 35).
; PLAN: r0=58(x), r1=35(y), r2=34(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 35
LDI r2, 34
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
