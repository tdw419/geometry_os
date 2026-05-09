; DESCRIPTION: Places a green 78x45 rectangle at position (97, 57).
; PLAN: r0=97(x), r1=57(y), r2=78(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 57
LDI r2, 78
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
