; DESCRIPTION: Places a green 63x60 rectangle at position (448, 2).
; PLAN: r0=448(x), r1=2(y), r2=63(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 2
LDI r2, 63
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
