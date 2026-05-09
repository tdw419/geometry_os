; DESCRIPTION: Renders a purple line between points (439, 221) and (214, 110).
; PLAN: r0=439(x1), r1=221(y1), r2=214(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 221
LDI r2, 214
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
