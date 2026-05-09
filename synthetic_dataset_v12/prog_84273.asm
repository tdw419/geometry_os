; DESCRIPTION: Renders a black line between points (373, 202) and (444, 161).
; PLAN: r0=373(x1), r1=202(y1), r2=444(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 202
LDI r2, 444
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
