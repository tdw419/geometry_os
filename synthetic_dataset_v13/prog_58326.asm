; DESCRIPTION: Places a black 99x75 rectangle at position (129, 179).
; PLAN: r0=129(x), r1=179(y), r2=99(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 179
LDI r2, 99
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
