; DESCRIPTION: Places a white 31x38 rectangle at position (351, 76).
; PLAN: r0=351(x), r1=76(y), r2=31(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 76
LDI r2, 31
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
