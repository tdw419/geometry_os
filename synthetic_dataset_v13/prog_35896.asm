; DESCRIPTION: Places a cyan 57x61 rectangle at position (97, 149).
; PLAN: r0=97(x), r1=149(y), r2=57(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 149
LDI r2, 57
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
