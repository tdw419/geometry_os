; DESCRIPTION: Places a red 97x58 rectangle at position (176, 79).
; PLAN: r0=176(x), r1=79(y), r2=97(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 79
LDI r2, 97
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
