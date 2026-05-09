; DESCRIPTION: Places a purple 98x118 rectangle at position (209, 31).
; PLAN: r0=209(x), r1=31(y), r2=98(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 31
LDI r2, 98
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
