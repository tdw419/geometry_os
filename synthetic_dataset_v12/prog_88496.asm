; DESCRIPTION: Places a black 34x114 rectangle at position (5, 71).
; PLAN: r0=5(x), r1=71(y), r2=34(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 71
LDI r2, 34
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
