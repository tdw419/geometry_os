; DESCRIPTION: Places a purple 109x114 rectangle at position (209, 89).
; PLAN: r0=209(x), r1=89(y), r2=109(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 89
LDI r2, 109
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
