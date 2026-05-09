; DESCRIPTION: Places a white 97x12 rectangle at position (318, 6).
; PLAN: r0=318(x), r1=6(y), r2=97(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 6
LDI r2, 97
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
