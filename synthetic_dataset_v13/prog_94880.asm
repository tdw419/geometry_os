; DESCRIPTION: Places a black 105x114 rectangle at position (189, 59).
; PLAN: r0=189(x), r1=59(y), r2=105(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 59
LDI r2, 105
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
