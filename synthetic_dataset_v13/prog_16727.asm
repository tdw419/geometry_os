; DESCRIPTION: Places a white 89x107 rectangle at position (14, 40).
; PLAN: r0=14(x), r1=40(y), r2=89(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 40
LDI r2, 89
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
