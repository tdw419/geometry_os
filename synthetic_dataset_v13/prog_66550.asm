; DESCRIPTION: Places a blue 63x109 rectangle at position (107, 37).
; PLAN: r0=107(x), r1=37(y), r2=63(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 37
LDI r2, 63
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
