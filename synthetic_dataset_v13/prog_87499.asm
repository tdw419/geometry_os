; DESCRIPTION: Renders a green line between points (447, 229) and (286, 169).
; PLAN: r0=447(x1), r1=229(y1), r2=286(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 229
LDI r2, 286
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
