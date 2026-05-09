; DESCRIPTION: Places a green 97x81 rectangle at position (379, 99).
; PLAN: r0=379(x), r1=99(y), r2=97(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 99
LDI r2, 97
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
