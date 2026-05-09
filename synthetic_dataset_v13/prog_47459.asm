; DESCRIPTION: Places a black 93x32 rectangle at position (31, 211).
; PLAN: r0=31(x), r1=211(y), r2=93(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 211
LDI r2, 93
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
