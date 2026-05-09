; DESCRIPTION: Places a black 119x47 rectangle at position (137, 114).
; PLAN: r0=137(x), r1=114(y), r2=119(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 114
LDI r2, 119
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
