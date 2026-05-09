; DESCRIPTION: Places a red line segment connecting (186, 154) to (360, 185).
; PLAN: r0=186(x1), r1=154(y1), r2=360(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 154
LDI r2, 360
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
