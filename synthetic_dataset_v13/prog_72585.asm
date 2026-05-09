; DESCRIPTION: Places a green 37x57 rectangle at position (94, 176).
; PLAN: r0=94(x), r1=176(y), r2=37(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 176
LDI r2, 37
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
