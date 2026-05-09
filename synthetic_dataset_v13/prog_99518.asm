; DESCRIPTION: Places a black 23x70 rectangle at position (179, 73).
; PLAN: r0=179(x), r1=73(y), r2=23(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 73
LDI r2, 23
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
