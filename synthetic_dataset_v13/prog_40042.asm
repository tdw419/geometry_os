; DESCRIPTION: Places a red 83x79 rectangle at position (97, 97).
; PLAN: r0=97(x), r1=97(y), r2=83(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 97
LDI r2, 83
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
