; DESCRIPTION: Places a blue 63x112 rectangle at position (44, 75).
; PLAN: r0=44(x), r1=75(y), r2=63(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 75
LDI r2, 63
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
