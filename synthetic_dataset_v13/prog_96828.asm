; DESCRIPTION: Places a white 62x89 rectangle at position (76, 130).
; PLAN: r0=76(x), r1=130(y), r2=62(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 130
LDI r2, 62
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
