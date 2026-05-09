; DESCRIPTION: Places a black 118x33 rectangle at position (138, 3).
; PLAN: r0=138(x), r1=3(y), r2=118(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 3
LDI r2, 118
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
