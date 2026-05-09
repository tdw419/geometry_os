; DESCRIPTION: Places a black 97x12 rectangle at position (356, 212).
; PLAN: r0=356(x), r1=212(y), r2=97(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 212
LDI r2, 97
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
