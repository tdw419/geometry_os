; DESCRIPTION: Places a black 61x107 rectangle at position (80, 85).
; PLAN: r0=80(x), r1=85(y), r2=61(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 85
LDI r2, 61
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
