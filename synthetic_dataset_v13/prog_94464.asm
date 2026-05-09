; DESCRIPTION: Places a black 75x66 rectangle at position (297, 91).
; PLAN: r0=297(x), r1=91(y), r2=75(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 91
LDI r2, 75
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
