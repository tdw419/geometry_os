; DESCRIPTION: Places a white 13x106 rectangle at position (343, 44).
; PLAN: r0=343(x), r1=44(y), r2=13(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 44
LDI r2, 13
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
