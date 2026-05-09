; DESCRIPTION: Places a black 60x82 rectangle at position (226, 87).
; PLAN: r0=226(x), r1=87(y), r2=60(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 87
LDI r2, 60
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
