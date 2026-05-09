; DESCRIPTION: Places a red 21x22 rectangle at position (351, 119).
; PLAN: r0=351(x), r1=119(y), r2=21(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 119
LDI r2, 21
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
