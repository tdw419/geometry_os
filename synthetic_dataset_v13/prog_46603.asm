; DESCRIPTION: Places a yellow line segment connecting (474, 47) to (36, 220).
; PLAN: r0=474(x1), r1=47(y1), r2=36(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 47
LDI r2, 36
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
