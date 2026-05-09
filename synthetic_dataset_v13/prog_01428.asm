; DESCRIPTION: Places a black 97x99 rectangle at position (334, 2).
; PLAN: r0=334(x), r1=2(y), r2=97(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 2
LDI r2, 97
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
