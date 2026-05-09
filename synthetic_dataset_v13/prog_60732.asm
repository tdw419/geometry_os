; DESCRIPTION: Places a red line segment connecting (504, 219) to (73, 71).
; PLAN: r0=504(x1), r1=219(y1), r2=73(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 219
LDI r2, 73
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
