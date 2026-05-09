; DESCRIPTION: Draws a purple line from (204, 242) to (321, 221).
; PLAN: r0=204(x1), r1=242(y1), r2=321(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 242
LDI r2, 321
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
