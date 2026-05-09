; DESCRIPTION: Places a black 107x51 rectangle at position (347, 42).
; PLAN: r0=347(x), r1=42(y), r2=107(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 42
LDI r2, 107
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
