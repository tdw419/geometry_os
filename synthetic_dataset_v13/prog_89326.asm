; DESCRIPTION: Places a magenta line segment connecting (233, 124) to (99, 46).
; PLAN: r0=233(x1), r1=124(y1), r2=99(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 124
LDI r2, 99
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
