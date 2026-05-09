; DESCRIPTION: Places a yellow line segment connecting (467, 13) to (138, 15).
; PLAN: r0=467(x1), r1=13(y1), r2=138(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 13
LDI r2, 138
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
