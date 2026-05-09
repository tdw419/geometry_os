; DESCRIPTION: Places a red line segment connecting (264, 220) to (124, 181).
; PLAN: r0=264(x1), r1=220(y1), r2=124(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 220
LDI r2, 124
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
