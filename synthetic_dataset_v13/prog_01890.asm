; DESCRIPTION: Places a black 94x57 rectangle at position (356, 149).
; PLAN: r0=356(x), r1=149(y), r2=94(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 149
LDI r2, 94
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
