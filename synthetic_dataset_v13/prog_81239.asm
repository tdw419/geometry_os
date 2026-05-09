; DESCRIPTION: Renders a green line between points (250, 33) and (110, 96).
; PLAN: r0=250(x1), r1=33(y1), r2=110(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 33
LDI r2, 110
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
