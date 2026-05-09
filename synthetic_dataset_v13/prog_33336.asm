; DESCRIPTION: Places a white 110x93 rectangle at position (334, 102).
; PLAN: r0=334(x), r1=102(y), r2=110(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 102
LDI r2, 110
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
