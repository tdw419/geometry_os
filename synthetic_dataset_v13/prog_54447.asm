; DESCRIPTION: Places a black 116x37 rectangle at position (334, 1).
; PLAN: r0=334(x), r1=1(y), r2=116(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 1
LDI r2, 116
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
