; DESCRIPTION: Renders a yellow line between points (398, 137) and (419, 43).
; PLAN: r0=398(x1), r1=137(y1), r2=419(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 137
LDI r2, 419
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
