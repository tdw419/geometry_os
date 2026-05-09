; DESCRIPTION: Places a cyan 95x104 rectangle at position (199, 122).
; PLAN: r0=199(x), r1=122(y), r2=95(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 122
LDI r2, 95
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
