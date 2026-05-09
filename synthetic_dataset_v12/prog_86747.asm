; DESCRIPTION: Places a black 114x88 rectangle at position (10, 114).
; PLAN: r0=10(x), r1=114(y), r2=114(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 114
LDI r2, 114
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
