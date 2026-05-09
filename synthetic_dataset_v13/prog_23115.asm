; DESCRIPTION: Places a red line segment connecting (279, 91) to (55, 169).
; PLAN: r0=279(x1), r1=91(y1), r2=55(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 91
LDI r2, 55
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
