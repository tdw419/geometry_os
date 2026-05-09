; DESCRIPTION: Places a blue 57x79 rectangle at position (204, 2).
; PLAN: r0=204(x), r1=2(y), r2=57(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 2
LDI r2, 57
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
