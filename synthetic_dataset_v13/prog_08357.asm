; DESCRIPTION: Places a blue 25x57 rectangle at position (85, 79).
; PLAN: r0=85(x), r1=79(y), r2=25(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 79
LDI r2, 25
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
