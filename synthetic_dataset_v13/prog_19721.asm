; DESCRIPTION: Places a cyan 76x115 rectangle at position (19, 97).
; PLAN: r0=19(x), r1=97(y), r2=76(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 97
LDI r2, 76
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
