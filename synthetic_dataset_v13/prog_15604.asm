; DESCRIPTION: Places a red line segment connecting (52, 5) to (453, 90).
; PLAN: r0=52(x1), r1=5(y1), r2=453(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 5
LDI r2, 453
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
