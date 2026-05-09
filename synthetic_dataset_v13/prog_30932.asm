; DESCRIPTION: Places a black 58x77 rectangle at position (439, 142).
; PLAN: r0=439(x), r1=142(y), r2=58(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 142
LDI r2, 58
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
