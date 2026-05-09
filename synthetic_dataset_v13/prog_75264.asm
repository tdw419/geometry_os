; DESCRIPTION: Places a red line segment connecting (388, 218) to (504, 237).
; PLAN: r0=388(x1), r1=218(y1), r2=504(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 218
LDI r2, 504
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
