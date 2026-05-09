; DESCRIPTION: Places a black 80x106 rectangle at position (7, 115).
; PLAN: r0=7(x), r1=115(y), r2=80(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 115
LDI r2, 80
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
