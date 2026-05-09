; DESCRIPTION: Draws a purple line from (242, 83) to (47, 221).
; PLAN: r0=242(x1), r1=83(y1), r2=47(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 83
LDI r2, 47
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
