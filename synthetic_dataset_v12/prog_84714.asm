; DESCRIPTION: Places a white 89x101 rectangle at position (374, 104).
; PLAN: r0=374(x), r1=104(y), r2=89(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 104
LDI r2, 89
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
