; DESCRIPTION: Places a black 64x70 rectangle at position (252, 31).
; PLAN: r0=252(x), r1=31(y), r2=64(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 31
LDI r2, 64
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
