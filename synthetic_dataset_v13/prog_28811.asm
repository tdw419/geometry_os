; DESCRIPTION: Places a blue 75x51 rectangle at position (145, 157).
; PLAN: r0=145(x), r1=157(y), r2=75(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 157
LDI r2, 75
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
