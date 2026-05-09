; DESCRIPTION: Places a purple 91x14 rectangle at position (339, 112).
; PLAN: r0=339(x), r1=112(y), r2=91(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 112
LDI r2, 91
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
