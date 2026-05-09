; DESCRIPTION: Places a purple 94x51 rectangle at position (210, 6).
; PLAN: r0=210(x), r1=6(y), r2=94(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 6
LDI r2, 94
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
