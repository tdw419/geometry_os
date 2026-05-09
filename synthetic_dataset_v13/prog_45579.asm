; DESCRIPTION: Places a yellow 23x118 rectangle at position (46, 90).
; PLAN: r0=46(x), r1=90(y), r2=23(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 90
LDI r2, 23
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
