; DESCRIPTION: Places a cyan 97x87 rectangle at position (240, 64).
; PLAN: r0=240(x), r1=64(y), r2=97(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 64
LDI r2, 97
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
