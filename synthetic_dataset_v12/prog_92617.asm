; DESCRIPTION: Places a black 51x40 rectangle at position (87, 147).
; PLAN: r0=87(x), r1=147(y), r2=51(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 147
LDI r2, 51
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
