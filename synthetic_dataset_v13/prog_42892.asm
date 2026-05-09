; DESCRIPTION: Renders a cyan line between points (369, 112) and (263, 85).
; PLAN: r0=369(x1), r1=112(y1), r2=263(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 112
LDI r2, 263
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
