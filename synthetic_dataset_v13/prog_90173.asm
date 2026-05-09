; DESCRIPTION: Places a blue 22x75 rectangle at position (63, 109).
; PLAN: r0=63(x), r1=109(y), r2=22(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 109
LDI r2, 22
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
