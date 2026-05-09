; DESCRIPTION: Places a blue 35x51 rectangle at position (460, 80).
; PLAN: r0=460(x), r1=80(y), r2=35(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 80
LDI r2, 35
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
