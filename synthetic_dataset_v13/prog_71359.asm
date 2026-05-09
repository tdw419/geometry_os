; DESCRIPTION: Places a black 15x83 rectangle at position (33, 22).
; PLAN: r0=33(x), r1=22(y), r2=15(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 22
LDI r2, 15
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
