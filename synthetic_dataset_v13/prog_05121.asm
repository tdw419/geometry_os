; DESCRIPTION: Places a black 57x57 rectangle at position (236, 114).
; PLAN: r0=236(x), r1=114(y), r2=57(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 114
LDI r2, 57
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
