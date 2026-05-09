; DESCRIPTION: Places a purple 88x37 rectangle at position (372, 51).
; PLAN: r0=372(x), r1=51(y), r2=88(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 51
LDI r2, 88
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
