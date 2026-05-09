; DESCRIPTION: Places a green 89x29 rectangle at position (183, 63).
; PLAN: r0=183(x), r1=63(y), r2=89(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 63
LDI r2, 89
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
