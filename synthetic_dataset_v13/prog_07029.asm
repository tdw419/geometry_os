; DESCRIPTION: Places a black 32x51 rectangle at position (349, 183).
; PLAN: r0=349(x), r1=183(y), r2=32(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 183
LDI r2, 32
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
