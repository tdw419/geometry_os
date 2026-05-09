; DESCRIPTION: Places a red line segment connecting (145, 48) to (337, 36).
; PLAN: r0=145(x1), r1=48(y1), r2=337(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 48
LDI r2, 337
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
