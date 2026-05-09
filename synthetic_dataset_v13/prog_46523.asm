; DESCRIPTION: Places a black 11x112 rectangle at position (406, 8).
; PLAN: r0=406(x), r1=8(y), r2=11(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 8
LDI r2, 11
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
