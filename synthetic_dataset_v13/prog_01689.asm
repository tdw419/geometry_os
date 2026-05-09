; DESCRIPTION: Draws a black line from (112, 36) to (439, 148).
; PLAN: r0=112(x1), r1=36(y1), r2=439(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 36
LDI r2, 439
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
