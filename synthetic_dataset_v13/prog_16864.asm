; DESCRIPTION: Places a yellow line segment connecting (152, 99) to (138, 71).
; PLAN: r0=152(x1), r1=99(y1), r2=138(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 99
LDI r2, 138
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
