; DESCRIPTION: Places a yellow 17x88 rectangle at position (29, 118).
; PLAN: r0=29(x), r1=118(y), r2=17(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 17
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
