; DESCRIPTION: Places a purple 26x89 rectangle at position (436, 82).
; PLAN: r0=436(x), r1=82(y), r2=26(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 82
LDI r2, 26
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
