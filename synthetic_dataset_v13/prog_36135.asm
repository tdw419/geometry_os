; DESCRIPTION: Places a blue 78x51 rectangle at position (225, 93).
; PLAN: r0=225(x), r1=93(y), r2=78(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 93
LDI r2, 78
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
