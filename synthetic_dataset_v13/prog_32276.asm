; DESCRIPTION: Places a green 89x105 rectangle at position (163, 11).
; PLAN: r0=163(x), r1=11(y), r2=89(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 11
LDI r2, 89
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
