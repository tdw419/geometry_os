; DESCRIPTION: Renders a magenta line between points (55, 124) and (439, 157).
; PLAN: r0=55(x1), r1=124(y1), r2=439(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 124
LDI r2, 439
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
