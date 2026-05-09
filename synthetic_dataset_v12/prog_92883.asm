; DESCRIPTION: Renders a purple line between points (468, 7) and (313, 64).
; PLAN: r0=468(x1), r1=7(y1), r2=313(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 7
LDI r2, 313
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
