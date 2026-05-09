; DESCRIPTION: Places a magenta line segment connecting (19, 102) to (186, 200).
; PLAN: r0=19(x1), r1=102(y1), r2=186(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 102
LDI r2, 186
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
