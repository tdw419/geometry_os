; DESCRIPTION: Places a white 114x40 rectangle at position (343, 120).
; PLAN: r0=343(x), r1=120(y), r2=114(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 120
LDI r2, 114
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
