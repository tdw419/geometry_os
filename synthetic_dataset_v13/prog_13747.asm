; DESCRIPTION: Places a cyan 58x65 rectangle at position (97, 82).
; PLAN: r0=97(x), r1=82(y), r2=58(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 82
LDI r2, 58
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
