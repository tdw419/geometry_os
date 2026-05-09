; DESCRIPTION: Places a red line segment connecting (146, 5) to (335, 144).
; PLAN: r0=146(x1), r1=5(y1), r2=335(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 5
LDI r2, 335
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
