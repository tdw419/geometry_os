; DESCRIPTION: Places a black 109x94 rectangle at position (178, 120).
; PLAN: r0=178(x), r1=120(y), r2=109(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 120
LDI r2, 109
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
