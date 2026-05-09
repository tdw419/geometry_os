; DESCRIPTION: Places a black 114x49 rectangle at position (353, 99).
; PLAN: r0=353(x), r1=99(y), r2=114(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 99
LDI r2, 114
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
