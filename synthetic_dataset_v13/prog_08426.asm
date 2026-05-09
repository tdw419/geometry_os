; DESCRIPTION: Renders a green line between points (256, 217) and (484, 96).
; PLAN: r0=256(x1), r1=217(y1), r2=484(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 217
LDI r2, 484
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
