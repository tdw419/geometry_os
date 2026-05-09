; DESCRIPTION: Places a yellow line segment connecting (291, 149) to (473, 234).
; PLAN: r0=291(x1), r1=149(y1), r2=473(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 149
LDI r2, 473
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
