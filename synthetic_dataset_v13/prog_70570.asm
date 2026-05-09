; DESCRIPTION: Places a magenta line segment connecting (400, 107) to (80, 241).
; PLAN: r0=400(x1), r1=107(y1), r2=80(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 107
LDI r2, 80
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
