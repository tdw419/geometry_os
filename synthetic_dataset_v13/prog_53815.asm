; DESCRIPTION: Renders a green line between points (234, 145) and (439, 38).
; PLAN: r0=234(x1), r1=145(y1), r2=439(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 145
LDI r2, 439
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
