; DESCRIPTION: Places a black 120x114 rectangle at position (78, 121).
; PLAN: r0=78(x), r1=121(y), r2=120(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 121
LDI r2, 120
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
