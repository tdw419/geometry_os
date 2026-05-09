; DESCRIPTION: Places a black 53x52 rectangle at position (4, 51).
; PLAN: r0=4(x), r1=51(y), r2=53(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 51
LDI r2, 53
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
