; DESCRIPTION: Places a black 10x110 rectangle at position (93, 138).
; PLAN: r0=93(x), r1=138(y), r2=10(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 138
LDI r2, 10
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
