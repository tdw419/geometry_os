; DESCRIPTION: Places a black 62x96 rectangle at position (406, 88).
; PLAN: r0=406(x), r1=88(y), r2=62(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 88
LDI r2, 62
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
