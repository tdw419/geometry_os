; DESCRIPTION: Draws a purple line from (423, 87) to (111, 242).
; PLAN: r0=423(x1), r1=87(y1), r2=111(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 87
LDI r2, 111
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
