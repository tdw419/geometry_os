; DESCRIPTION: Renders a white line between points (225, 242) and (447, 147).
; PLAN: r0=225(x1), r1=242(y1), r2=447(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 242
LDI r2, 447
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
