; DESCRIPTION: Places a green 89x33 rectangle at position (378, 74).
; PLAN: r0=378(x), r1=74(y), r2=89(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 74
LDI r2, 89
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
