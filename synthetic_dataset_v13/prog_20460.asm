; DESCRIPTION: Places a purple 107x81 rectangle at position (58, 25).
; PLAN: r0=58(x), r1=25(y), r2=107(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 25
LDI r2, 107
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
