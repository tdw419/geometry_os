; DESCRIPTION: Places a magenta line segment connecting (424, 169) to (386, 142).
; PLAN: r0=424(x1), r1=169(y1), r2=386(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 169
LDI r2, 386
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
