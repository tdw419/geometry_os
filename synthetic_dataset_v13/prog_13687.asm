; DESCRIPTION: Places a yellow line segment connecting (27, 58) to (249, 216).
; PLAN: r0=27(x1), r1=58(y1), r2=249(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 58
LDI r2, 249
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
