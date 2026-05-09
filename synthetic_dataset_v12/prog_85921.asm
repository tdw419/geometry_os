; DESCRIPTION: Places a white 105x23 rectangle at position (311, 77).
; PLAN: r0=311(x), r1=77(y), r2=105(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 77
LDI r2, 105
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
