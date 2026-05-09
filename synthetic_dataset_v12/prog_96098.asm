; DESCRIPTION: Places a black 64x57 rectangle at position (283, 109).
; PLAN: r0=283(x), r1=109(y), r2=64(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 109
LDI r2, 64
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
