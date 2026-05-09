; DESCRIPTION: Renders a black line between points (439, 97) and (221, 182).
; PLAN: r0=439(x1), r1=97(y1), r2=221(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 97
LDI r2, 221
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
