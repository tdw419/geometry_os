; DESCRIPTION: Places a cyan 16x101 rectangle at position (131, 31).
; PLAN: r0=131(x), r1=31(y), r2=16(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 31
LDI r2, 16
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
