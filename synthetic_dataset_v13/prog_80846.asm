; DESCRIPTION: Places a yellow 80x89 rectangle at position (216, 145).
; PLAN: r0=216(x), r1=145(y), r2=80(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 145
LDI r2, 80
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
