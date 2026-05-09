; DESCRIPTION: Places a blue 34x118 rectangle at position (163, 104).
; PLAN: r0=163(x), r1=104(y), r2=34(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 104
LDI r2, 34
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
