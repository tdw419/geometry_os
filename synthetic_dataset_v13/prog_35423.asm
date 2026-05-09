; DESCRIPTION: Places a white 45x13 rectangle at position (115, 57).
; PLAN: r0=115(x), r1=57(y), r2=45(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 57
LDI r2, 45
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
