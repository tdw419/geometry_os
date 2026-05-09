; DESCRIPTION: Places a yellow 105x118 rectangle at position (181, 124).
; PLAN: r0=181(x), r1=124(y), r2=105(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 124
LDI r2, 105
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
