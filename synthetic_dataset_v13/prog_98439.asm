; DESCRIPTION: Places a black 12x61 rectangle at position (96, 44).
; PLAN: r0=96(x), r1=44(y), r2=12(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 44
LDI r2, 12
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
