; DESCRIPTION: Places a green 89x57 rectangle at position (371, 188).
; PLAN: r0=371(x), r1=188(y), r2=89(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 188
LDI r2, 89
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
