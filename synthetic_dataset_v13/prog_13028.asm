; DESCRIPTION: Renders a purple line between points (408, 95) and (26, 242).
; PLAN: r0=408(x1), r1=95(y1), r2=26(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 95
LDI r2, 26
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
