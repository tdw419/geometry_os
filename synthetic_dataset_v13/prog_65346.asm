; DESCRIPTION: Places a cyan 64x89 rectangle at position (15, 31).
; PLAN: r0=15(x), r1=31(y), r2=64(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 31
LDI r2, 64
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
