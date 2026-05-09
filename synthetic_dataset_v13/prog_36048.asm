; DESCRIPTION: Places a black 28x118 rectangle at position (97, 54).
; PLAN: r0=97(x), r1=54(y), r2=28(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 54
LDI r2, 28
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
