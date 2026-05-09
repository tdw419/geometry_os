; DESCRIPTION: Places a purple 81x14 rectangle at position (170, 37).
; PLAN: r0=170(x), r1=37(y), r2=81(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 37
LDI r2, 81
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
