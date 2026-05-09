; DESCRIPTION: Renders a yellow line between points (463, 236) and (444, 0).
; PLAN: r0=463(x1), r1=236(y1), r2=444(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 236
LDI r2, 444
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
