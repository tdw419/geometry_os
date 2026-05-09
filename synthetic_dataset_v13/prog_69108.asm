; DESCRIPTION: Places a black 94x82 rectangle at position (216, 73).
; PLAN: r0=216(x), r1=73(y), r2=94(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 73
LDI r2, 94
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
