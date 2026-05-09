; DESCRIPTION: Places a red 100x114 rectangle at position (77, 122).
; PLAN: r0=77(x), r1=122(y), r2=100(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 122
LDI r2, 100
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
