; DESCRIPTION: Places a black 19x12 rectangle at position (365, 87).
; PLAN: r0=365(x), r1=87(y), r2=19(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 87
LDI r2, 19
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
