; DESCRIPTION: Places a green 76x73 rectangle at position (381, 179).
; PLAN: r0=381(x), r1=179(y), r2=76(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 179
LDI r2, 76
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
