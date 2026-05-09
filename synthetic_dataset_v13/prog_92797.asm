; DESCRIPTION: Places a blue 10x89 rectangle at position (382, 133).
; PLAN: r0=382(x), r1=133(y), r2=10(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 133
LDI r2, 10
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
