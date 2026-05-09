; DESCRIPTION: Places a black 110x101 rectangle at position (40, 135).
; PLAN: r0=40(x), r1=135(y), r2=110(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 135
LDI r2, 110
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
