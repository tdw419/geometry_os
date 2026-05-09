; DESCRIPTION: Places a yellow line segment connecting (393, 75) to (145, 177).
; PLAN: r0=393(x1), r1=75(y1), r2=145(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 75
LDI r2, 145
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
