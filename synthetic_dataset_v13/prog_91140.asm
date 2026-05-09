; DESCRIPTION: Places a white 75x37 rectangle at position (76, 141).
; PLAN: r0=76(x), r1=141(y), r2=75(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 141
LDI r2, 75
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
