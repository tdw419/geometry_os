; DESCRIPTION: Places a black 63x60 rectangle at position (226, 194).
; PLAN: r0=226(x), r1=194(y), r2=63(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 194
LDI r2, 63
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
