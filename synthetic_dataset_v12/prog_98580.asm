; DESCRIPTION: Places a white 66x25 rectangle at position (351, 159).
; PLAN: r0=351(x), r1=159(y), r2=66(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 159
LDI r2, 66
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
