; DESCRIPTION: Renders a red line between points (444, 237) and (77, 5).
; PLAN: r0=444(x1), r1=237(y1), r2=77(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 237
LDI r2, 77
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
