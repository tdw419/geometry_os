; DESCRIPTION: Renders a yellow line between points (498, 251) and (394, 96).
; PLAN: r0=498(x1), r1=251(y1), r2=394(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 251
LDI r2, 394
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
