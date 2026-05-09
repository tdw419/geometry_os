; DESCRIPTION: Places a green 30x106 rectangle at position (94, 75).
; PLAN: r0=94(x), r1=75(y), r2=30(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 75
LDI r2, 30
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
