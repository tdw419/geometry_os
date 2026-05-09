; DESCRIPTION: Places a black 35x100 rectangle at position (363, 124).
; PLAN: r0=363(x), r1=124(y), r2=35(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 124
LDI r2, 35
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
