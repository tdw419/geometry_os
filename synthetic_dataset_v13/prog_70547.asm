; DESCRIPTION: Places a blue 12x81 rectangle at position (477, 70).
; PLAN: r0=477(x), r1=70(y), r2=12(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 70
LDI r2, 12
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
