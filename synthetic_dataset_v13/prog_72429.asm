; DESCRIPTION: Places a green line segment connecting (175, 160) to (80, 124).
; PLAN: r0=175(x1), r1=160(y1), r2=80(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 160
LDI r2, 80
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
