; DESCRIPTION: Places a magenta 35x24 rectangle at position (419, 142).
; PLAN: r0=419(x), r1=142(y), r2=35(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 142
LDI r2, 35
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
