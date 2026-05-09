; DESCRIPTION: Places a black 30x82 rectangle at position (47, 82).
; PLAN: r0=47(x), r1=82(y), r2=30(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 82
LDI r2, 30
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
