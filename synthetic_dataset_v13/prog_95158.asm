; DESCRIPTION: Places a red line segment connecting (20, 124) to (156, 169).
; PLAN: r0=20(x1), r1=124(y1), r2=156(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 124
LDI r2, 156
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
