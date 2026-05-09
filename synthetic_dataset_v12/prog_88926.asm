; DESCRIPTION: Places a cyan 21x83 rectangle at position (468, 128).
; PLAN: r0=468(x), r1=128(y), r2=21(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 128
LDI r2, 21
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
