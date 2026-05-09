; DESCRIPTION: Places a yellow line segment connecting (192, 249) to (216, 33).
; PLAN: r0=192(x1), r1=249(y1), r2=216(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 249
LDI r2, 216
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
