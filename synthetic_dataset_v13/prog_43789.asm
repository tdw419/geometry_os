; DESCRIPTION: Places a white 60x66 rectangle at position (139, 179).
; PLAN: r0=139(x), r1=179(y), r2=60(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 179
LDI r2, 60
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
