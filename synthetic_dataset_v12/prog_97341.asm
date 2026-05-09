; DESCRIPTION: Places a cyan 19x26 rectangle at position (66, 80).
; PLAN: r0=66(x), r1=80(y), r2=19(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 80
LDI r2, 19
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
