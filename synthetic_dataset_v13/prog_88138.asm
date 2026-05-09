; DESCRIPTION: Places a red 60x99 rectangle at position (63, 110).
; PLAN: r0=63(x), r1=110(y), r2=60(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 110
LDI r2, 60
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
