; DESCRIPTION: Places a black 87x40 rectangle at position (24, 98).
; PLAN: r0=24(x), r1=98(y), r2=87(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 98
LDI r2, 87
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
