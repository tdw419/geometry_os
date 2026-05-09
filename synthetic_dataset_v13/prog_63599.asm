; DESCRIPTION: Places a black 108x30 rectangle at position (56, 226).
; PLAN: r0=56(x), r1=226(y), r2=108(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 226
LDI r2, 108
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
