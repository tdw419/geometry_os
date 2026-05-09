; DESCRIPTION: Places a green 31x57 rectangle at position (296, 97).
; PLAN: r0=296(x), r1=97(y), r2=31(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 97
LDI r2, 31
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
