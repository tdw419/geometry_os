; DESCRIPTION: Places a black 116x48 rectangle at position (363, 155).
; PLAN: r0=363(x), r1=155(y), r2=116(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 155
LDI r2, 116
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
