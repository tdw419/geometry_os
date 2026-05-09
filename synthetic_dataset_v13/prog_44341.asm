; DESCRIPTION: Places a black 10x106 rectangle at position (124, 25).
; PLAN: r0=124(x), r1=25(y), r2=10(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 25
LDI r2, 10
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
