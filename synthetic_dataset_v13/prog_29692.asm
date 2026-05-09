; DESCRIPTION: Renders a green line between points (135, 137) and (419, 144).
; PLAN: r0=135(x1), r1=137(y1), r2=419(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 137
LDI r2, 419
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
