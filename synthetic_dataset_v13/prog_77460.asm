; DESCRIPTION: Places a green line segment connecting (350, 217) to (36, 179).
; PLAN: r0=350(x1), r1=217(y1), r2=36(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 217
LDI r2, 36
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
