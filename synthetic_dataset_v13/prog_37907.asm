; DESCRIPTION: Places a red line segment connecting (489, 146) to (439, 66).
; PLAN: r0=489(x1), r1=146(y1), r2=439(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 146
LDI r2, 439
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
