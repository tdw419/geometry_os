; DESCRIPTION: Places a yellow 19x118 rectangle at position (198, 74).
; PLAN: r0=198(x), r1=74(y), r2=19(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 74
LDI r2, 19
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
