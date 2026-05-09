; DESCRIPTION: Places a black 35x16 rectangle at position (388, 56).
; PLAN: r0=388(x), r1=56(y), r2=35(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 56
LDI r2, 35
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
