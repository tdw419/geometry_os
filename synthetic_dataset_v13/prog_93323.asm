; DESCRIPTION: Places a white 12x83 rectangle at position (89, 99).
; PLAN: r0=89(x), r1=99(y), r2=12(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 99
LDI r2, 12
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
