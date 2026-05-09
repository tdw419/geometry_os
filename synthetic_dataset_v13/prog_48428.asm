; DESCRIPTION: Places a black 59x13 rectangle at position (24, 80).
; PLAN: r0=24(x), r1=80(y), r2=59(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 80
LDI r2, 59
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
