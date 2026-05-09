; DESCRIPTION: Places a purple 43x51 rectangle at position (72, 40).
; PLAN: r0=72(x), r1=40(y), r2=43(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 40
LDI r2, 43
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
