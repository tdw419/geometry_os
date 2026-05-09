; DESCRIPTION: Places a black 35x95 rectangle at position (158, 110).
; PLAN: r0=158(x), r1=110(y), r2=35(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 110
LDI r2, 35
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
