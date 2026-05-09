; DESCRIPTION: Places a cyan 73x99 rectangle at position (195, 128).
; PLAN: r0=195(x), r1=128(y), r2=73(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 128
LDI r2, 73
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
