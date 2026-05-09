; DESCRIPTION: Renders a magenta line between points (321, 22) and (271, 80).
; PLAN: r0=321(x1), r1=22(y1), r2=271(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 22
LDI r2, 271
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
