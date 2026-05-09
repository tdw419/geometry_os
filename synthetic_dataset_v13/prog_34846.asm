; DESCRIPTION: Places a white 76x94 rectangle at position (15, 85).
; PLAN: r0=15(x), r1=85(y), r2=76(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 85
LDI r2, 76
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
