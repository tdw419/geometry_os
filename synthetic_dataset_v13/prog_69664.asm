; DESCRIPTION: Renders a cyan line between points (414, 110) and (260, 119).
; PLAN: r0=414(x1), r1=110(y1), r2=260(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 110
LDI r2, 260
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
