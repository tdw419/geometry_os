; DESCRIPTION: Places a yellow 118x84 rectangle at position (96, 58).
; PLAN: r0=96(x), r1=58(y), r2=118(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 58
LDI r2, 118
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
