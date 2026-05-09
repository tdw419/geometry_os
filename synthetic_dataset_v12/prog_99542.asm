; DESCRIPTION: Renders a green line between points (356, 66) and (300, 80).
; PLAN: r0=356(x1), r1=66(y1), r2=300(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 66
LDI r2, 300
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
