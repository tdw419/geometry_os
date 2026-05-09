; DESCRIPTION: Places a white 89x78 rectangle at position (136, 120).
; PLAN: r0=136(x), r1=120(y), r2=89(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 120
LDI r2, 89
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
