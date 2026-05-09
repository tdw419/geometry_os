; DESCRIPTION: Places a purple 11x51 rectangle at position (20, 24).
; PLAN: r0=20(x), r1=24(y), r2=11(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 24
LDI r2, 11
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
