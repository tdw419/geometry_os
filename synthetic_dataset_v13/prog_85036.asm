; DESCRIPTION: Renders a cyan line between points (137, 22) and (454, 145).
; PLAN: r0=137(x1), r1=22(y1), r2=454(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 22
LDI r2, 454
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
