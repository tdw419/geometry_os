; DESCRIPTION: Places a purple 87x51 rectangle at position (225, 78).
; PLAN: r0=225(x), r1=78(y), r2=87(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 78
LDI r2, 87
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
