; DESCRIPTION: Places a yellow line segment connecting (465, 236) to (62, 141).
; PLAN: r0=465(x1), r1=236(y1), r2=62(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 236
LDI r2, 62
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
