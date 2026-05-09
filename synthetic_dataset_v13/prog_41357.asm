; DESCRIPTION: Places a white 37x66 rectangle at position (438, 122).
; PLAN: r0=438(x), r1=122(y), r2=37(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 122
LDI r2, 37
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
