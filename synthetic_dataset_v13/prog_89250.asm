; DESCRIPTION: Renders a yellow line between points (186, 15) and (143, 202).
; PLAN: r0=186(x1), r1=15(y1), r2=143(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 15
LDI r2, 143
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
