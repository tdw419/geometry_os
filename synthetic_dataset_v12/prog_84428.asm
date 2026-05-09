; DESCRIPTION: Places a green 79x12 rectangle at position (351, 167).
; PLAN: r0=351(x), r1=167(y), r2=79(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 167
LDI r2, 79
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
