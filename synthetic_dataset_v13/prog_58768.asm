; DESCRIPTION: Places a purple 55x23 rectangle at position (339, 51).
; PLAN: r0=339(x), r1=51(y), r2=55(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 51
LDI r2, 55
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
