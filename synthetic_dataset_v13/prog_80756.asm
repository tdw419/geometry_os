; DESCRIPTION: Places a white 59x36 rectangle at position (343, 118).
; PLAN: r0=343(x), r1=118(y), r2=59(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 118
LDI r2, 59
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
