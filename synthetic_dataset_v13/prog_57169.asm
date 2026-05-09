; DESCRIPTION: Places a green 98x85 rectangle at position (97, 75).
; PLAN: r0=97(x), r1=75(y), r2=98(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 75
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
