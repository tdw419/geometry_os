; DESCRIPTION: Places a red line segment connecting (90, 112) to (350, 178).
; PLAN: r0=90(x1), r1=112(y1), r2=350(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 112
LDI r2, 350
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
