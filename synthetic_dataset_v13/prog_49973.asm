; DESCRIPTION: Places a red line segment connecting (420, 218) to (237, 31).
; PLAN: r0=420(x1), r1=218(y1), r2=237(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 218
LDI r2, 237
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
