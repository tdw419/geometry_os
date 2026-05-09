; DESCRIPTION: Places a white 89x11 rectangle at position (272, 67).
; PLAN: r0=272(x), r1=67(y), r2=89(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 67
LDI r2, 89
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
