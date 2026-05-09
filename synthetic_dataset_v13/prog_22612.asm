; DESCRIPTION: Places a black 62x80 rectangle at position (439, 114).
; PLAN: r0=439(x), r1=114(y), r2=62(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 114
LDI r2, 62
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
