; DESCRIPTION: Places a blue 60x11 rectangle at position (89, 133).
; PLAN: r0=89(x), r1=133(y), r2=60(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 133
LDI r2, 60
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
