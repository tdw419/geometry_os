; DESCRIPTION: Places a black 100x119 rectangle at position (245, 118).
; PLAN: r0=245(x), r1=118(y), r2=100(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 118
LDI r2, 100
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
