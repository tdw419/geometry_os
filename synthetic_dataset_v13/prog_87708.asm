; DESCRIPTION: Places a purple 29x118 rectangle at position (412, 17).
; PLAN: r0=412(x), r1=17(y), r2=29(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 17
LDI r2, 29
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
