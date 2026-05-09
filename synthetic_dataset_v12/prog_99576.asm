; DESCRIPTION: Places a purple line segment connecting (186, 247) to (294, 85).
; PLAN: r0=186(x1), r1=247(y1), r2=294(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 247
LDI r2, 294
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
