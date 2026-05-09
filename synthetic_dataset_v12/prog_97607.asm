; DESCRIPTION: Places a black 87x11 rectangle at position (347, 167).
; PLAN: r0=347(x), r1=167(y), r2=87(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 167
LDI r2, 87
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
