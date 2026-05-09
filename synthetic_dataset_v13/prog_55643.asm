; DESCRIPTION: Places a black 19x91 rectangle at position (226, 101).
; PLAN: r0=226(x), r1=101(y), r2=19(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 101
LDI r2, 19
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
