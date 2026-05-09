; DESCRIPTION: Places a purple 49x80 rectangle at position (167, 89).
; PLAN: r0=167(x), r1=89(y), r2=49(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 89
LDI r2, 49
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
