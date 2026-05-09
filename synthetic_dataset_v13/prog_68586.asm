; DESCRIPTION: Places a black 101x108 rectangle at position (51, 22).
; PLAN: r0=51(x), r1=22(y), r2=101(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 22
LDI r2, 101
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
