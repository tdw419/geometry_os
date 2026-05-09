; DESCRIPTION: Places a black 15x12 rectangle at position (179, 92).
; PLAN: r0=179(x), r1=92(y), r2=15(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 92
LDI r2, 15
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
