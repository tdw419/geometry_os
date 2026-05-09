; DESCRIPTION: Places a black 87x40 rectangle at position (238, 106).
; PLAN: r0=238(x), r1=106(y), r2=87(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 106
LDI r2, 87
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
