; DESCRIPTION: Places a blue 98x61 rectangle at position (141, 145).
; PLAN: r0=141(x), r1=145(y), r2=98(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 145
LDI r2, 98
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
