; DESCRIPTION: Places a black 16x94 rectangle at position (381, 51).
; PLAN: r0=381(x), r1=51(y), r2=16(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 51
LDI r2, 16
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
