; DESCRIPTION: Places a purple 77x118 rectangle at position (192, 29).
; PLAN: r0=192(x), r1=29(y), r2=77(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 29
LDI r2, 77
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
