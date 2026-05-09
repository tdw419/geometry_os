; DESCRIPTION: Renders a purple line between points (221, 26) and (371, 242).
; PLAN: r0=221(x1), r1=26(y1), r2=371(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 26
LDI r2, 371
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
