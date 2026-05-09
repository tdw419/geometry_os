; DESCRIPTION: Places a black 32x11 rectangle at position (325, 202).
; PLAN: r0=325(x), r1=202(y), r2=32(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 202
LDI r2, 32
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
