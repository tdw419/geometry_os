; DESCRIPTION: Places a black 110x33 rectangle at position (33, 115).
; PLAN: r0=33(x), r1=115(y), r2=110(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 115
LDI r2, 110
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
