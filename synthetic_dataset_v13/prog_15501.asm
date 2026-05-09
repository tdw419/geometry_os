; DESCRIPTION: Renders a yellow line between points (408, 85) and (388, 143).
; PLAN: r0=408(x1), r1=85(y1), r2=388(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 85
LDI r2, 388
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
