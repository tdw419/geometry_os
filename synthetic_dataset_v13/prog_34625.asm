; DESCRIPTION: Places a white 97x15 rectangle at position (194, 0).
; PLAN: r0=194(x), r1=0(y), r2=97(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 0
LDI r2, 97
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
