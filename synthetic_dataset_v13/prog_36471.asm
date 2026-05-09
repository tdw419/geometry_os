; DESCRIPTION: Places a red 66x88 rectangle at position (351, 143).
; PLAN: r0=351(x), r1=143(y), r2=66(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 143
LDI r2, 66
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
