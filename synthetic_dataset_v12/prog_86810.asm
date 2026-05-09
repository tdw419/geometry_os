; DESCRIPTION: Places a blue 51x12 rectangle at position (461, 119).
; PLAN: r0=461(x), r1=119(y), r2=51(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 119
LDI r2, 51
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
