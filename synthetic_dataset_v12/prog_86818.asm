; DESCRIPTION: Places a green 47x106 rectangle at position (97, 61).
; PLAN: r0=97(x), r1=61(y), r2=47(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 61
LDI r2, 47
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
