; DESCRIPTION: Places a cyan 32x79 rectangle at position (308, 151).
; PLAN: r0=308(x), r1=151(y), r2=32(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 151
LDI r2, 32
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
