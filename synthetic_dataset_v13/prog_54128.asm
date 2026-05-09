; DESCRIPTION: Places a white 115x110 rectangle at position (389, 26).
; PLAN: r0=389(x), r1=26(y), r2=115(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 26
LDI r2, 115
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
