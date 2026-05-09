; DESCRIPTION: Places a black 22x44 rectangle at position (14, 72).
; PLAN: r0=14(x), r1=72(y), r2=22(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 72
LDI r2, 22
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
