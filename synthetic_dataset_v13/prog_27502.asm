; DESCRIPTION: Places a yellow 118x88 rectangle at position (145, 139).
; PLAN: r0=145(x), r1=139(y), r2=118(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 139
LDI r2, 118
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
