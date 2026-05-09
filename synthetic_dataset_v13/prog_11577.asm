; DESCRIPTION: Places a green line segment connecting (253, 73) to (468, 119).
; PLAN: r0=253(x1), r1=73(y1), r2=468(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 73
LDI r2, 468
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
