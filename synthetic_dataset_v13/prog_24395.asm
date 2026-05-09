; DESCRIPTION: Places a red 89x96 rectangle at position (351, 104).
; PLAN: r0=351(x), r1=104(y), r2=89(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 104
LDI r2, 89
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
