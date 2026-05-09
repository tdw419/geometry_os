; DESCRIPTION: Places a black 92x76 rectangle at position (179, 61).
; PLAN: r0=179(x), r1=61(y), r2=92(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 61
LDI r2, 92
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
