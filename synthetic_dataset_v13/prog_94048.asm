; DESCRIPTION: Places a white 89x29 rectangle at position (62, 176).
; PLAN: r0=62(x), r1=176(y), r2=89(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 176
LDI r2, 89
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
