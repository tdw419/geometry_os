; DESCRIPTION: Places a black 118x100 rectangle at position (132, 102).
; PLAN: r0=132(x), r1=102(y), r2=118(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 102
LDI r2, 118
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
