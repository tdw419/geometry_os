; DESCRIPTION: Places a black 22x52 rectangle at position (97, 148).
; PLAN: r0=97(x), r1=148(y), r2=22(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 148
LDI r2, 22
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
