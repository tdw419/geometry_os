; DESCRIPTION: Places a black 57x79 rectangle at position (64, 7).
; PLAN: r0=64(x), r1=7(y), r2=57(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 7
LDI r2, 57
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
