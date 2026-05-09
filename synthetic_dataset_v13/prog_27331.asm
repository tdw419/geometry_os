; DESCRIPTION: Places a purple 51x89 rectangle at position (435, 134).
; PLAN: r0=435(x), r1=134(y), r2=51(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 134
LDI r2, 51
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
