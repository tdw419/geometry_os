; DESCRIPTION: Places a red line segment connecting (504, 36) to (196, 218).
; PLAN: r0=504(x1), r1=36(y1), r2=196(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 36
LDI r2, 196
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
