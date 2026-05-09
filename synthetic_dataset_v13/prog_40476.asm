; DESCRIPTION: Places a cyan 87x81 rectangle at position (371, 89).
; PLAN: r0=371(x), r1=89(y), r2=87(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 89
LDI r2, 87
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
