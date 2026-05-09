; DESCRIPTION: Places a blue 89x19 rectangle at position (251, 185).
; PLAN: r0=251(x), r1=185(y), r2=89(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 185
LDI r2, 89
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
