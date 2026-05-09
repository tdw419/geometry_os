; DESCRIPTION: Places a white line segment connecting (145, 33) to (147, 134).
; PLAN: r0=145(x1), r1=33(y1), r2=147(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 33
LDI r2, 147
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
