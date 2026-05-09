; DESCRIPTION: Places a red 104x30 rectangle at position (351, 97).
; PLAN: r0=351(x), r1=97(y), r2=104(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 97
LDI r2, 104
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
